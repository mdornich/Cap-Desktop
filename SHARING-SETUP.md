# CAP Local Setup - Complete Guide

This repository contains a complete local setup for the CAP screen recording application with a custom U-shaped corporate template.

## What's Included

- **Local Docker Backend**: MySQL database and MinIO storage that runs entirely on your machine
- **Custom U-shaped Template**: Pre-configured corporate template with branded colors
- **Desktop App Configuration**: CAP desktop app configured to use the local backend instead of cap.so

## Prerequisites

1. **Docker Desktop** installed and running
2. **CAP Desktop App** - Download "Cap - Development.app" from the CAP project
3. **Git** (to clone this repository)

## Setup Instructions

### Step 1: Clone and Navigate
```bash
git clone [YOUR-FORK-URL]
cd cap-desktop
```

### Step 2: Start the Local Backend
```bash
chmod +x start-local-cap.sh
./start-local-cap.sh
```

This will start:
- MySQL database on port 3307
- MinIO object storage on port 3906

### Step 3: Verify .env Configuration
The `.env` file should already be configured with:
```
VITE_SERVER_URL=http://localhost:3005
DATABASE_URL=mysql://root:@localhost:3307/planetscale?ssl={"rejectUnauthorized":false}
S3_PUBLIC_ENDPOINT=http://localhost:3906
S3_INTERNAL_ENDPOINT=http://localhost:3906
CAP_AWS_ACCESS_KEY=capS3root
CAP_AWS_SECRET_KEY=capS3root
CAP_AWS_BUCKET=capso
CAP_AWS_REGION=us-east-1
```

### Step 4: Launch CAP Desktop App
1. Open the "Cap - Development.app" 
2. The app should automatically connect to your local backend
3. Look for the "U-Shape Corporate" template in the templates section

## Usage

- **Start Backend**: `./start-local-cap.sh`
- **Stop Backend**: `./stop-local-cap.sh`
- **Check Status**: `docker ps` (should show cap-mysql and cap-minio containers)

## Troubleshooting

### Backend Not Starting
- Ensure Docker Desktop is running
- Check that ports 3307 and 3906 are not in use by other applications
- Run `docker logs cap-mysql` or `docker logs cap-minio` to check for errors

### Desktop App Not Connecting
- Verify the `.env` file configuration matches the above
- Restart the CAP desktop app after starting the backend
- Check that `VITE_SERVER_URL=http://localhost:3005` in the `.env` file

### Template Not Appearing
- The U-shaped template should appear in the CAP desktop app's template selection
- If not visible, restart the app after ensuring the backend is running

## Cleanup

To completely remove all local data:
```bash
./stop-local-cap.sh
docker volume rm cap-desktop_cap_mysql_data cap-desktop_cap_minio_data
```

## Brand Colors Used

- Primary: #0B557A (deep blue)
- Secondary: #A3DDFB (light blue)
- Template: U-shaped gradient with camera positioned in bottom-left