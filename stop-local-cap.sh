#!/bin/bash

echo "🛑 Stopping Local Cap Installation..."

echo "🐳 Stopping backend services..."
docker-compose -f docker-compose.complete.yml down

echo "✅ All services stopped!"
echo ""
echo "💡 To remove all data and start fresh:"
echo "   docker-compose -f docker-compose.complete.yml down -v"