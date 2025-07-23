# 🎥 Local Cap Installation - Complete Setup

A fully local, private Cap installation with the **U-Shape Corporate template** included. No authentication required, perfect for sharing with colleagues.

## ✨ Features

- 🚀 **Local Cap Desktop App** - Full native application
- 📐 **U-Shape Corporate Template** - Pre-configured recording layout
- 🗄️ **Local Database** - MySQL in Docker
- 💾 **Local Storage** - MinIO S3-compatible in Docker  
- 🔒 **No Authentication** - Completely private and offline
- 📦 **Easy Sharing** - Complete package for colleagues

## 🚀 Quick Start

### 1. Start Everything
```bash
./start-local-cap.sh
```

This starts the backend services (database + storage).

### 2. Start Cap Desktop App
```bash
pnpm dev
```

### 3. Use U-Shape Template
1. Open Cap app
2. Look for "U-Shape Corporate" in templates/presets
3. Start recording with your professional template!

## 📁 What's Included

- `docker-compose.complete.yml` - Complete backend setup
- `SETUP-GUIDE.md` - Detailed setup instructions  
- `start-local-cap.sh` / `stop-local-cap.sh` - Easy start/stop scripts
- `.env` - Desktop app configuration (connects to local services)
- Modified Rust code with U-Shape template

## 🔧 Services

When running:
- **MySQL Database**: `localhost:3307`
- **MinIO Storage**: `localhost:3906`
- **MinIO Console**: `localhost:3907`
- **Desktop App**: `localhost:3008`

## 💾 Data

All your recordings and data stay local:
- Database: Docker volume `cap-mysql-data`
- Videos/Files: Docker volume `cap-minio-data`

## 🤝 Sharing with Colleagues

To share this setup:

1. **Copy entire `cap-desktop` folder**
2. **Ensure they have prerequisites**: Docker, Node.js, Rust, pnpm
3. **Run `./start-local-cap.sh`** 
4. **Run `pnpm dev`**

That's it! No additional configuration needed.

## 🛑 Stop Everything

```bash
./stop-local-cap.sh
```

## 📋 Prerequisites

- Docker Desktop
- Node.js 20+
- Rust (install from https://rustup.rs/)
- pnpm (`npm install -g pnpm`)
- macOS: `brew install pkg-config ffmpeg`

## 🆘 Troubleshooting

See `SETUP-GUIDE.md` for detailed troubleshooting and configuration options.

---

**Ready to record with your U-Shape Corporate template! 🎬**