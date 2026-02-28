# OpenClaw Setup — One-Command Deploy

Set up a fully configured OpenClaw instance on a new machine in minutes.
No wizard, no manual config, no re-onboarding.

## Requirements

- macOS (Apple Silicon or Intel)
- Homebrew installed
- Access to the secrets file (ask Ming)

## Quick Start

```bash
# 1. Clone this repo
git clone <this-repo> ~/openclaw-setup
cd ~/openclaw-setup

# 2. Add your secrets file (get from Ming — never commit this)
cp /path/to/openclaw-secrets.env secrets.env

# 3. Run setup
./scripts/setup.sh
```

Done. OpenClaw gateway starts automatically with all agents configured.

## What Gets Installed

- OpenClaw (latest)
- All agent configs (king, product-owner, tech-lead, verifier, content, researcher)
- Skills (firecrawl, ui-ux-pro-max, coding-agent, etc.)
- Provider configs (Anthropic, OpenRouter, Moonshot, Gemini, etc.)
- Channel configs (Discord, Telegram)

## What's NOT Included

- Project code / repositories
- Session history
- Personal workspace files (MEMORY.md, USER.md)
- Credentials / API keys (those go in `secrets.env`, never in git)

## Secrets File Format

See `secrets.env.example` for the required keys.
