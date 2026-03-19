#!/bin/bash

# ============================================================
# SOVEREIGN ECOSYSTEM - DEPLOYMENT SCRIPT
# ============================================================

set -e

echo "🚀 SOVEREIGN ECOSYSTEM DEPLOYMENT"
echo "=================================="

# Check if Docker is running
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed or not in PATH"
    exit 1
fi

if ! docker ps &> /dev/null; then
    echo "❌ Docker daemon is not running"
    exit 1
fi

echo "✅ Docker is running"

# Load environment
if [ ! -f .env ]; then
    echo "📋 Creating .env from .env.example..."
    cp .env.example .env
    echo "⚠️  Please edit .env with your configuration"
fi

# Build images
echo ""
echo "🔨 Building Docker images..."
docker-compose build --no-cache

# Start services
echo ""
echo "🎯 Starting services..."
docker-compose up -d

# Wait for services to be ready
echo ""
echo "⏳ Waiting for services to be healthy..."
sleep 5

# Check service health
echo ""
echo "📊 Service Status:"
docker-compose ps

echo ""
echo "✅ SOVEREIGN ECOSYSTEM is running!"
echo ""
echo "📍 Access Points:"
echo "  • Backend API: http://localhost:3000"
echo "  • Haven IDE: http://localhost:9002"
echo "  • Niyah Engine (Ollama): http://localhost:11434"
echo "  • Database: localhost:3306"
echo ""
echo "💡 Useful commands:"
echo "  • View logs: docker-compose logs -f"
echo "  • Stop: docker-compose down"
echo "  • Restart: docker-compose restart"
echo ""
