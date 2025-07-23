#!/bin/bash

echo "🚀 Starting Local Cap Installation..."
echo "This will start the backend services and prepare the desktop app"
echo ""

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker Desktop first."
    exit 1
fi

echo "🐳 Starting backend services (MySQL + MinIO)..."
docker-compose -f docker-compose.complete.yml up -d

echo "⏳ Waiting for services to be healthy..."
sleep 10

echo "📊 Service Status:"
docker-compose -f docker-compose.complete.yml ps

echo ""
echo "✅ Backend services are running!"
echo ""
echo "📱 To start the Cap desktop app, run:"
echo "   pnpm dev"
echo ""
echo "🔗 Service URLs:"
echo "   MySQL Database: localhost:3307"
echo "   MinIO Storage: http://localhost:3906"
echo "   MinIO Console: http://localhost:3907"
echo ""
echo "📖 See SETUP-GUIDE.md for detailed instructions"
echo "🛑 To stop services: docker-compose -f docker-compose.complete.yml down"