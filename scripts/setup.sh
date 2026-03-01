#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
OPENCLAW_DIR="$HOME/.openclaw"

echo "🚀 OpenClaw Setup"
echo "================="

# ── 1. Check secrets ──────────────────────────────────────────────────────────
if [ ! -f "$REPO_DIR/secrets.env" ]; then
  echo "❌ secrets.env not found."
  echo "   Copy secrets.env.example → secrets.env and fill in your API keys."
  exit 1
fi
source "$REPO_DIR/secrets.env"
echo "✅ Secrets loaded"

# ── 2. Install OpenClaw ───────────────────────────────────────────────────────
if ! command -v openclaw &>/dev/null; then
  echo "📦 Installing OpenClaw..."
  npm install -g openclaw
else
  echo "✅ OpenClaw already installed ($(openclaw --version 2>/dev/null || echo 'unknown version'))"
fi

# ── 3. Apply config ───────────────────────────────────────────────────────────
mkdir -p "$OPENCLAW_DIR"

echo "⚙️  Applying config..."
# Substitute ${HOME} in template
sed "s|\${HOME}|$HOME|g" "$REPO_DIR/config/openclaw.template.json" > "$OPENCLAW_DIR/openclaw.json"

# Inject API keys via openclaw config
openclaw config set env.OPENROUTER_API_KEY "$OPENROUTER_API_KEY" 2>/dev/null || true
openclaw config set env.MOONSHOT_API_KEY "$MOONSHOT_API_KEY" 2>/dev/null || true

echo "✅ Config applied"

# ── 4. Deploy agent workspaces ────────────────────────────────────────────────
echo "🤖 Deploying agents..."
AGENTS=(king product-owner tech-lead content researcher verifier)

for agent in "${AGENTS[@]}"; do
  dest="$OPENCLAW_DIR/agents/$agent"
  src="$REPO_DIR/agent-templates/$agent"
  mkdir -p "$dest"
  if [ -d "$src" ]; then
    cp -n "$src"/*.md "$dest/" 2>/dev/null || true  # -n = don't overwrite existing
  fi
  # Create blank USER.md and MEMORY.md if missing
  [ -f "$dest/USER.md" ] || echo "# USER.md" > "$dest/USER.md"
  echo "  ✓ $agent"
done

echo "✅ Agents deployed"

# ── 5. Install skills ─────────────────────────────────────────────────────────
if [ -f "$REPO_DIR/scripts/install-skills.sh" ]; then
  echo "🧩 Installing skills..."
  bash "$REPO_DIR/scripts/install-skills.sh"
fi

# ── 6. Doctor + Start ─────────────────────────────────────────────────────────
echo "🔧 Running doctor..."
openclaw doctor --quiet 2>/dev/null || openclaw doctor

echo "🟢 Starting gateway..."
openclaw gateway restart

sleep 2
openclaw status

echo ""
echo "✨ Done! OpenClaw is running."
echo "   Dashboard: http://localhost:19000"
