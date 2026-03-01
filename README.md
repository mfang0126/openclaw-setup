# OpenClaw Setup — One-Command Deploy

Set up a fully configured OpenClaw multi-agent instance on a new machine in minutes.
No wizard, no manual config, no re-onboarding.

Includes a pre-built agent team:
- **King** — Discord orchestrator
- **Product Owner** — user stories, requirements
- **Tech Lead** — code, architecture, bugs
- **Content Writer** — blog, LinkedIn, copywriting
- **Researcher** — information gathering
- **Verifier** — QA and validation

## Requirements

- macOS (Homebrew) or Linux (Node 20+)
- `npm` installed
- Your API keys (see below)

## Quick Start

```bash
# 1. Clone
git clone https://github.com/mfang0126/openclaw-setup ~/openclaw-setup
cd ~/openclaw-setup

# 2. Add your secrets
cp secrets.env.example secrets.env
# Edit secrets.env with your API keys and tokens

# 3. Configure your Discord/Telegram IDs
# Edit config/openclaw.template.json — replace all YOUR_* placeholders

# 4. Run
./scripts/setup.sh
```

Done. OpenClaw gateway starts automatically with all agents configured.

## Configuration

### 1. secrets.env
Copy `secrets.env.example` → `secrets.env` and fill in:
- AI provider API keys (Anthropic, OpenAI, OpenRouter, etc.)
- Discord bot tokens (one per agent)
- Telegram bot tokens

### 2. config/openclaw.template.json
Replace these placeholders with your own values:

| Placeholder | Where to find it |
|-------------|-----------------|
| `YOUR_GUILD_ID` | Discord server → Right-click server name → Copy Server ID |
| `YOUR_GENERAL_CHANNEL_ID` | Right-click channel → Copy Channel ID |
| `YOUR_PRODUCT_OWNER_CHANNEL_ID` | Same |
| `YOUR_TECH_LEAD_CHANNEL_ID` | Same |
| `YOUR_CONTENT_CHANNEL_ID` | Same |
| `YOUR_RESEARCH_CHANNEL_ID` | Same |
| `YOUR_VERIFY_CHANNEL_ID` | Same |
| `YOUR_TELEGRAM_USER_ID` | Message @userinfobot on Telegram |
| `your-guild-slug` | Any label you want |

> Enable Developer Mode in Discord: Settings → Advanced → Developer Mode

## What Gets Installed

- OpenClaw (latest via npm)
- All agent configs + workspace files
- Skills: firecrawl, ui-ux-pro-max, coding-agent, research-hub, and more
- Provider configs (Anthropic, OpenRouter, Moonshot, Gemini, ZAI)

## What's NOT Included

- Session history
- Personal workspace files (MEMORY.md, USER.md — created blank on first run)
- Credentials / API keys (those go in `secrets.env`, never in git)

## Security

`secrets.env` is in `.gitignore` and will never be committed.
Treat it like a password — don't share it.

## Customising Agents

Agent personality and routing rules live in `agent-templates/<agent>/`:
- `SOUL.md` — personality and tone
- `AGENTS.md` — routing rules and team structure

Edit these before running setup, or update them in `~/.openclaw/agents/<agent>/` after.
