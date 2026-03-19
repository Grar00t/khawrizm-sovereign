# ============================================================
# SOVEREIGN ECOSYSTEM - DEPLOYMENT SCRIPT (PowerShell)
# ============================================================

Write-Host "🚀 SOVEREIGN ECOSYSTEM DEPLOYMENT" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Green

# Check if Docker is running
try {
    $null = docker ps 2>$null
} catch {
    Write-Host "❌ Docker is not running" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker is running" -ForegroundColor Green

# Load environment
if (-not (Test-Path ".env")) {
    Write-Host "📋 Creating .env from .env.example..." -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "⚠️  Please edit .env with your configuration" -ForegroundColor Yellow
}

# Build images
Write-Host ""
Write-Host "🔨 Building Docker images..." -ForegroundColor Yellow
docker-compose build --no-cache

# Start services
Write-Host ""
Write-Host "🎯 Starting services..." -ForegroundColor Yellow
docker-compose up -d

# Wait for services to be ready
Write-Host ""
Write-Host "⏳ Waiting for services to be healthy..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

# Check service health
Write-Host ""
Write-Host "📊 Service Status:" -ForegroundColor Cyan
docker-compose ps

Write-Host ""
Write-Host "✅ SOVEREIGN ECOSYSTEM is running!" -ForegroundColor Green
Write-Host ""
Write-Host "📍 Access Points:" -ForegroundColor Cyan
Write-Host "  • Backend API: http://localhost:3000"
Write-Host "  • Haven IDE: http://localhost:9002"
Write-Host "  • Niyah Engine (Ollama): http://localhost:11434"
Write-Host "  • Database: localhost:3306"
Write-Host ""
Write-Host "💡 Useful commands:" -ForegroundColor Cyan
Write-Host "  • View logs: docker-compose logs -f"
Write-Host "  • Stop: docker-compose down"
Write-Host "  • Restart: docker-compose restart"
Write-Host ""
