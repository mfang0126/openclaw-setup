> 🇨🇳 [中文说明](./README.zh-CN.md)

# OpenClaw Setup — One-Command Deploy

Set up a fully configured OpenClaw AI assistant on any machine in minutes.
No developer tools required. No wizard. No manual configuration.

---

## What You'll Get

A personal AI assistant connected to your Telegram, powered by the best AI models (Claude, Kimi, GPT, Gemini) — all through OpenRouter.

---

## Requirements

- macOS or Linux *(Windows: use WSL2)*
- `curl` — pre-installed on macOS and most Linux
- 3 API keys *(details below)*

---

## Step-by-Step Setup

### Step 1 — Download this repo

```bash
git clone https://github.com/mfang0126/openclaw-setup ~/openclaw-setup
cd ~/openclaw-setup
```

> Don't have `git`? On macOS, running the above command will prompt you to install it automatically.

---

### Step 2 — Get your 3 API keys

| Key | Where to get it | Time |
|-----|----------------|------|
| `OPENROUTER_API_KEY` | Sign up at [openrouter.ai](https://openrouter.ai) → Dashboard → Keys → Create Key | ~2 min |
| `MOONSHOT_API_KEY` | Sign up at [platform.moonshot.cn](https://platform.moonshot.cn) → API Keys → Create | ~2 min |
| `TELEGRAM_BOT_TOKEN` | Open Telegram → search **@BotFather** → send `/newbot` → follow prompts → copy the token | ~2 min |

---

### Step 3 — Add your keys

```bash
cp secrets.env.example secrets.env
```

Open `secrets.env` in any text editor and fill in your 3 keys:

```env
OPENROUTER_API_KEY=sk-or-v1-...
MOONSHOT_API_KEY=sk-...
TELEGRAM_BOT_TOKEN=123456:ABC-...
```

---

### Step 4 — Add your Telegram user ID

This tells the bot to only respond to you (security).

1. Open Telegram → search **@userinfobot** → send any message
2. It replies with your user ID (a number like `123456789`)
3. Open `config/openclaw.template.json`, find `YOUR_TELEGRAM_USER_ID` and replace it with your number

---

### Step 5 — Run setup

```bash
./scripts/setup.sh
```

This will:
- Install OpenClaw (including Node.js if needed)
- Apply your configuration
- Install AI skills
- Start the gateway

---

### Step 6 — Test it

Open Telegram, message your bot. It should reply. ✅

---

## Security

- `secrets.env` is in `.gitignore` — it will **never** be committed to git
- Your bot only responds to your Telegram user ID
- API keys are stored locally on your machine only

---

## Updating

```bash
cd ~/openclaw-setup
git pull
./scripts/setup.sh
```

---

## Troubleshooting

**Bot doesn't respond?**
Run `openclaw status` to check the gateway is running.

**Permission error on setup.sh?**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**Want to change the AI model?**
Edit `config/openclaw.template.json` → `agents.defaults.model.primary`

---