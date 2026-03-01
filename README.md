# OpenClaw Setup — One-Command Deploy

> 🇨🇳 [中文说明 →](#chinese)

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
---

<a name="chinese"></a>

# OpenClaw 一键部署

> 🇬🇧 [English ↑](#openclaw-setup--one-command-deploy)

在任何电脑上，几分钟内部署好你的 AI 助手。
不需要任何开发经验，不需要手动配置。

---

## 你会得到什么

一个连接到 Telegram 的个人 AI 助手，支持 Claude、Kimi、GPT、Gemini 等主流模型，通过 OpenRouter 统一接入。

---

## 系统要求

- macOS 或 Linux（Windows 请用 WSL2）
- `curl`（macOS 和大多数 Linux 自带）
- 3 个 API Key（下面有详细说明）

---

## 安装步骤

### 第一步 — 下载这个项目

```bash
git clone https://github.com/mfang0126/openclaw-setup ~/openclaw-setup
cd ~/openclaw-setup
```

> 没有 `git`？macOS 上运行上面的命令会自动提示你安装。

---

### 第二步 — 获取 3 个 API Key

| Key | 去哪里拿 | 大约时间 |
|-----|---------|---------|
| `OPENROUTER_API_KEY` | 注册 [openrouter.ai](https://openrouter.ai) → Dashboard → Keys → Create Key | ~2 分钟 |
| `MOONSHOT_API_KEY` | 注册 [platform.moonshot.cn](https://platform.moonshot.cn) → API Keys → 新建 | ~2 分钟 |
| `TELEGRAM_BOT_TOKEN` | 打开 Telegram → 搜索 **@BotFather** → 发送 `/newbot` → 按提示操作 → 复制 token | ~2 分钟 |

---

### 第三步 — 填入你的 Key

```bash
cp secrets.env.example secrets.env
```

用任意文本编辑器打开 `secrets.env`，填入 3 个 Key：

```env
OPENROUTER_API_KEY=sk-or-v1-...
MOONSHOT_API_KEY=sk-...
TELEGRAM_BOT_TOKEN=123456:ABC-...
```

---

### 第四步 — 填入你的 Telegram 用户 ID

这是为了让 bot 只响应你（安全设置）。

1. 打开 Telegram → 搜索 **@userinfobot** → 发任意消息
2. 它会回复你的用户 ID（一串数字，如 `123456789`）
3. 打开 `config/openclaw.template.json`，找到 `YOUR_TELEGRAM_USER_ID`，替换成你的数字

---

### 第五步 — 运行安装脚本

```bash
./scripts/setup.sh
```

脚本会自动完成：
- 安装 OpenClaw（如需要，会自动安装 Node.js）
- 应用你的配置
- 安装 AI Skills
- 启动 Gateway

---

### 第六步 — 测试

打开 Telegram，给你的 bot 发消息，它应该会回复。✅

---

## 安全说明

- `secrets.env` 已加入 `.gitignore`，**不会**被提交到 git
- Bot 只响应你的 Telegram 用户 ID
- API Key 仅存储在你本地电脑上

---

## 更新

```bash
cd ~/openclaw-setup
git pull
./scripts/setup.sh
```

---

## 常见问题

**Bot 没有回复？**
运行 `openclaw status` 检查 gateway 是否正在运行。

**setup.sh 报权限错误？**
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

**想换 AI 模型？**
编辑 `config/openclaw.template.json` → `agents.defaults.model.primary`
