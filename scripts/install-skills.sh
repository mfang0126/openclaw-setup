#!/bin/bash
# Install recommended skills via clawhub

# Ensure clawhub is installed
if ! command -v clawhub &>/dev/null; then
  echo "📦 Installing clawhub..."
  npm install -g clawhub --quiet
fi

SKILLS=(
  firecrawl
  ui-ux-pro-max
  coding-agent
  research-hub
  html-screenshot
  docx
  pdf
  github
  nano-banana-pro
)

echo "🧩 Installing skills..."
for skill in "${SKILLS[@]}"; do
  echo "  → $skill"
  clawhub install "$skill" --yes 2>/dev/null || echo "    ⚠️  $skill skipped (not found or already installed)"
done
echo "✅ Skills done"
