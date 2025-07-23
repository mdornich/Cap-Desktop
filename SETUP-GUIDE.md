# Local Cap Setup Guide

This is a complete local installation of Cap with the U-Shape Corporate template. It runs entirely offline without requiring authentication.

## What's Included

- **Local Cap Desktop App** with U-Shape Corporate template
- **Local Database** (MySQL in Docker)
- **Local Storage** (MinIO S3-compatible in Docker)
- **No Authentication Required** - completely private and local

## Prerequisites

1. **Docker Desktop** - Install from https://www.docker.com/products/docker-desktop/
2. **Node.js 20+** - Install from https://nodejs.org/
3. **Rust** - Install from https://rustup.rs/
4. **pnpm** - Install with `npm install -g pnpm`

### macOS Additional Requirements
```bash
# Install system dependencies
brew install pkg-config ffmpeg
```

## Quick Start

### 1. Start Backend Services
```bash
# Start the local database and storage
docker-compose -f docker-compose.complete.yml up -d

# Check that services are running
docker-compose -f docker-compose.complete.yml ps
```

### 2. Start Cap Desktop App
```bash
# Install dependencies (first time only)
pnpm install

# Start the desktop app
pnpm dev
```

The desktop app will automatically connect to the local backend services.

### 3. Using the U-Shape Template

1. Open the Cap desktop app
2. Go to **Settings** or **Templates**
3. Select **"U-Shape Corporate"** template
4. Start recording!

## Configuration

The desktop app is configured to use local services via `.env`:

```bash
# Connects to local Docker backend
VITE_SERVER_URL=http://localhost:3005
DATABASE_URL=mysql://root:@localhost:3307/planetscale
S3_PUBLIC_ENDPOINT=http://localhost:3906

# Local storage credentials
CAP_AWS_ACCESS_KEY=capS3root
CAP_AWS_SECRET_KEY=capS3root
CAP_AWS_BUCKET=capso
```

## Service Ports

- **MySQL Database**: `localhost:3307`
- **MinIO Storage API**: `localhost:3906`
- **MinIO Console**: `localhost:3907` (web interface)
- **Desktop App**: `localhost:3008`
- **Web Interface**: `localhost:3005` (optional, requires profile)

## Data Storage

All recordings and data are stored locally:
- **Database**: Docker volume `cap-mysql-data`
- **Files/Videos**: Docker volume `cap-minio-data`

## Troubleshooting

### Desktop App Won't Start
```bash
# Check if Rust is installed
cargo --version

# Install FFmpeg if missing (macOS)
brew install ffmpeg pkg-config

# Clean and rebuild
pnpm clean && pnpm install
```

### Backend Services Issues
```bash
# Check service status
docker-compose -f docker-compose.complete.yml logs

# Reset everything
docker-compose -f docker-compose.complete.yml down -v
docker-compose -f docker-compose.complete.yml up -d
```

### Port Conflicts
If you get port conflicts, edit `docker-compose.complete.yml` and `.env` to use different ports.

## Sharing This Setup

To share with a colleague:

1. **Copy this entire folder** to their machine
2. **Ensure they have the prerequisites installed**
3. **Run the Quick Start steps**

That's it! No additional configuration needed.

## Optional Web Interface

To also run the web interface (browser-based):
```bash
docker-compose -f docker-compose.complete.yml --profile web up -d
```

Then visit http://localhost:3005 (though the desktop app is recommended).

## Stopping Services

```bash
# Stop desktop app: Ctrl+C in terminal

# Stop backend services
docker-compose -f docker-compose.complete.yml down

# Stop and remove all data (fresh start)
docker-compose -f docker-compose.complete.yml down -v
```