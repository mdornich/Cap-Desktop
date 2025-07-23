#!/bin/bash

# Cap Local Private Installation Startup Script
# This script starts your local, private Cap installation
# No external dependencies or authentication required

echo "🚀 Starting Cap Local Private Installation..."
echo ""
echo "This will start Cap on: http://localhost:3005"
echo "No login required - completely local and private!"
echo ""

# Check if Docker is running
if ! docker info >/dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

# Stop any existing containers with the same name
echo "🧹 Cleaning up any existing containers..."
docker compose -f docker-compose.local.yml down 2>/dev/null

# Start the containers
echo "🏗️  Starting Cap containers..."
docker compose -f docker-compose.local.yml up -d

# Wait for services to be ready
echo "⏳ Waiting for services to start..."
sleep 10

# Check if containers are running
if docker compose -f docker-compose.local.yml ps | grep -q "Up"; then
    echo ""
    echo "✅ Cap Local is now running!"
    echo ""
    echo "🌐 Open your browser and go to: http://localhost:3005"
    echo "📹 Start recording - no login required!"
    echo ""
    echo "To stop Cap Local, run: ./stop-cap-local.sh"
    echo "Or run: docker compose -f docker-compose.local.yml down"
    echo ""
else
    echo ""
    echo "❌ Something went wrong starting the containers."
    echo "Check the logs with: docker compose -f docker-compose.local.yml logs"
fi