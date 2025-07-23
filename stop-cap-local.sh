#!/bin/bash

# Cap Local Private Installation Stop Script

echo "🛑 Stopping Cap Local Private Installation..."

docker compose -f docker-compose.local.yml down

echo "✅ Cap Local has been stopped."
echo ""
echo "Your recordings and data are preserved."
echo "To start again, run: ./start-cap-local.sh"