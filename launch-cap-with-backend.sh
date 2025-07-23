#!/bin/bash

# CAP Desktop Launcher with Auto-Backend
# This script starts the Docker backend and then launches the CAP desktop app

echo "🚀 Starting CAP with local backend..."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    echo "Opening Docker Desktop..."
    open -a "Docker Desktop"
    echo "Waiting for Docker to start (30 seconds)..."
    sleep 30
fi

# Start the backend services
echo "🐳 Starting CAP backend services..."
docker-compose -f docker-compose.complete.yml up -d

# Wait for services to be ready
echo "⏳ Waiting for services to initialize..."
sleep 8

# Check if services are running
if docker ps | grep -q "cap-mysql" && docker ps | grep -q "cap-minio"; then
    echo "✅ Backend services are running!"
    echo "📊 MySQL: localhost:3307"
    echo "📦 MinIO: localhost:3906"
else
    echo "⚠️  Backend services may not be fully ready yet..."
fi

# Launch the CAP desktop app
echo "🎥 Launching CAP Desktop App..."
if [ -d "/Applications/Cap - Development.app" ]; then
    open -a "Cap - Development.app"
    echo "✅ CAP Desktop App launched!"
    echo ""
    echo "🎯 Ready to record! Look for the 'U-Shape Corporate' template."
else
    echo "❌ CAP Desktop App not found in /Applications/"
    echo "Please install 'Cap - Development.app' first."
fi

echo ""
echo "💡 To stop the backend later, run: ./stop-local-cap.sh"