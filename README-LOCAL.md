# Cap Local Private Installation

A completely local and private Cap screen recording setup that runs in Docker.

## Features

- ✅ **No authentication required** - works offline
- ✅ **Completely private** - all data stays on your computer  
- ✅ **No external dependencies** - doesn't connect to Cap.so servers
- ✅ **Easy to share** - just copy the folder and run
- ✅ **Includes U-Shape Corporate template** (coming soon)
- ✅ **Persistent data** - your recordings are saved between sessions

## Requirements

- Docker Desktop installed and running
- Available ports: 3005 (web), 3307 (database), 3906-3907 (storage)

## Quick Start

1. **Start Cap:**
   ```bash
   ./start-cap-local.sh
   ```

2. **Open your browser:**
   ```
   http://localhost:3005
   ```

3. **Start recording!** No login required.

4. **Stop Cap when done:**
   ```bash
   ./stop-cap-local.sh
   ```

## Manual Commands

If the scripts don't work, you can run these commands manually:

**Start:**
```bash
docker compose -f docker-compose.local.yml up -d
```

**Stop:**
```bash
docker compose -f docker-compose.local.yml down
```

**View logs:**
```bash
docker compose -f docker-compose.local.yml logs
```

## Troubleshooting

**Port conflicts:**
If you get port conflicts, edit `docker-compose.local.yml` and change the port numbers on the left side of the colon (e.g., `3005:3000` → `3008:3000`).

**Docker not running:**
Make sure Docker Desktop is installed and running before starting Cap.

**Containers won't start:**
Check logs with: `docker compose -f docker-compose.local.yml logs`

## Data Storage

Your recordings and data are stored in Docker volumes:
- `cap-local-mysql` - Database
- `cap-local-minio-data` - Video files and recordings

To completely remove all data:
```bash
docker compose -f docker-compose.local.yml down -v
```

## Sharing with Friends

To share this setup:
1. Copy this entire folder
2. Make sure they have Docker Desktop installed
3. They run `./start-cap-local.sh`
4. They go to `http://localhost:3005`

That's it! No additional setup needed.