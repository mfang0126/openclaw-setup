#!/bin/bash
# Install recommended skills via clawhub

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
