# 🚀 SOVEREIGN ECOSYSTEM — QUICK COMMANDS REFERENCE

## ✅ Current Status (Run These Now)

```powershell
# Check all containers
docker-compose ps

# View all logs in real-time
docker-compose logs -f

# Test backend API
curl http://localhost:3000/health

# Test API info
curl http://localhost:3000/api

# Access frontend
Start-Process http://localhost:9002
```

---

## 🔧 Essential Commands

### View Logs
```powershell
# All services
docker-compose logs

# Specific service
docker-compose logs backend
docker-compose logs haven_ide
docker-compose logs mariadb
docker-compose logs ollama

# Last 10 lines
docker-compose logs --tail 10

# Live streaming
docker-compose logs -f
```

### Manage Services
```powershell
# Start all
docker-compose up -d

# Stop all
docker-compose down

# Restart service
docker-compose restart backend

# Rebuild and restart
docker-compose build --no-cache
docker-compose up -d

# Remove all containers
docker-compose down -v
```

### Database Access
```powershell
# Access MySQL shell
docker exec -it sovereign_mariadb mysql -u sovereign_user -p -e "USE sovereign_db; SHOW TABLES;"

# Or interactive
docker exec -it sovereign_mariadb mysql -u sovereign_user -p

# Password: sovereign-pass-2024 (from .env)
```

### Backend API Access
```powershell
# Shell into backend
docker exec -it sovereign_backend sh

# View logs from inside
docker exec -it sovereign_backend cat /app/logs/*.log

# Restart specific service
docker exec -it sovereign_backend npm restart
```

### Ollama AI Commands
```powershell
# List available models
curl http://localhost:11434/api/tags

# Pull a model
docker exec -it sovereign_niyah_engine ollama pull llama2

# Generate with model
curl -X POST http://localhost:11434/api/generate -d '{"model":"llama2","prompt":"Hello world"}'

# Check status
curl http://localhost:11434/api/status
```

---

## 🌐 Access Points

```
Frontend Dashboard:  http://localhost:9002
Backend API:         http://localhost:3000
API Health Check:    http://localhost:3000/health
Database:            localhost:3306
Ollama API:          http://localhost:11434

Browser URLs:
- http://localhost:9002  ← Haven IDE (main interface)
- http://localhost:3000  ← Backend API documentation
```

---

## 📊 System Monitoring

```powershell
# Real-time stats
docker stats

# Container details
docker inspect sovereign_backend

# Network info
docker network inspect sovereign_network

# Volume info
docker volume inspect sovereign_ecosystem_mariadb_data
docker volume inspect sovereign_ecosystem_ollama_data

# Memory usage
docker ps --format "table {{.Names}}\t{{.MemUsage}}"
```

---

## 🧪 Testing Commands

```powershell
# Test backend
curl -X GET http://localhost:3000/health

# Test API
curl -X GET http://localhost:3000/api

# Test database from host
mysql -h localhost -u sovereign_user -p sovereign_db

# Test Ollama
curl http://localhost:11434/api/tags

# Test Haven IDE
Invoke-WebRequest http://localhost:9002
```

---

## 🔍 Debugging

```powershell
# View errors in backend
docker-compose logs backend --tail 50 | Select-String "error" -Context 3

# Check container health
docker ps --all --format="table {{.Names}}\t{{.Status}}"

# View docker-compose config
docker-compose config

# Validate docker-compose file
docker-compose config --quiet

# Test connectivity between containers
docker exec sovereign_backend ping mariadb
docker exec sovereign_backend curl http://mariadb:3306
```

---

## 🛠️ Troubleshooting

### Backend won't start
```powershell
docker-compose down
docker-compose build --no-cache backend
docker-compose up -d backend
docker-compose logs backend
```

### Database connection error
```powershell
docker-compose restart mariadb
docker-compose logs mariadb
docker exec -it sovereign_mariadb mysql -u root -p
```

### Port already in use
```powershell
# Find what's using the port
netstat -ano | findstr :3000

# Kill the process
taskkill /PID <PID> /F

# Or change port in docker-compose.yml
# Edit: ports: - "3001:3000"  # Changed from 3000 to 3001
```

### Ollama not responding
```powershell
docker-compose restart ollama
docker-compose logs ollama --tail 20
curl http://localhost:11434/api/tags
```

---

## 📦 Build & Deploy

```powershell
# Full rebuild (clean)
docker-compose down -v
docker-compose build --no-cache
docker-compose up -d

# Quick rebuild (specific service)
docker-compose build --no-cache backend
docker-compose up -d backend

# Update environment
cp .env.example .env
# Edit .env with your values
docker-compose restart
```

---

## 🔐 Security

```powershell
# View current .env
cat .env

# Regenerate secrets
# Edit .env with new passwords
docker-compose restart mariadb

# Check exposed ports
docker-compose ps

# Verify no secrets in code
Select-String -Path "*.js" -Pattern "password|secret|key" -Recurse
```

---

## 📈 Performance

```powershell
# Memory usage
docker stats --no-stream

# Process tree
docker ps -a --format="table {{.Names}}\t{{.CPUPerc}}\t{{.MemUsage}}"

# Disk usage
docker system df

# Clean up unused resources
docker system prune -a

# View log sizes
docker exec sovereign_backend ls -lh /app/logs/
```

---

## 🚀 Full Deployment Script

```powershell
# Complete fresh deployment
Write-Host "Stopping existing services..."
docker-compose down

Write-Host "Rebuilding all services..."
docker-compose build --no-cache

Write-Host "Starting services..."
docker-compose up -d

Write-Host "Waiting for services to be ready..."
Start-Sleep -Seconds 10

Write-Host "Checking status..."
docker-compose ps

Write-Host "Testing backend..."
$health = curl -Uri "http://localhost:3000/health"
Write-Host "Backend status: $health"

Write-Host "Opening frontend..."
Start-Process "http://localhost:9002"

Write-Host "Deployment complete! ✅"
```

---

## 💾 Backup & Restore

```powershell
# Backup database
docker exec sovereign_mariadb mysqldump -u sovereign_user -p sovereign_db > backup.sql

# Restore database
docker exec -i sovereign_mariadb mysql -u sovereign_user -p sovereign_db < backup.sql

# Backup volumes
docker run --rm -v sovereign_ecosystem_mariadb_data:/data -v ${PWD}:/backup alpine tar czf /backup/db-backup.tar.gz -C /data .

# Restore volumes
docker run --rm -v sovereign_ecosystem_mariadb_data:/data -v ${PWD}:/backup alpine tar xzf /backup/db-backup.tar.gz -C /data
```

---

## 📝 Useful Environment Variables

```bash
# Backend
NODE_ENV=production
PORT=3000
DB_HOST=mariadb
DB_PORT=3306

# Database
DB_ROOT_PASSWORD=sovereign-root-2024
DB_NAME=sovereign_db
DB_USER=sovereign_user
DB_PASSWORD=sovereign-pass-2024

# Frontend
NEXT_PUBLIC_API_URL=http://backend:3000

# Ollama
OLLAMA_HOST=0.0.0.0:11434
```

---

## 🎯 One-Liners

```powershell
# Deploy all and show status
docker-compose build --no-cache && docker-compose up -d && Start-Sleep 5 && docker-compose ps

# Show everything
docker-compose ps && docker-compose logs --tail 20

# Clear and redeploy
docker-compose down -v && docker-compose up -d

# Quick health check
curl http://localhost:3000/health && curl http://localhost:11434/api/tags

# Monitor in real-time
docker stats
```

---

## 🔗 Related Files

- docker-compose.yml — Main configuration
- .env — Environment variables (copy from .env.example)
- 2_Backend/Dockerfile — Backend build
- 3_Core_Engines/Haven_IDE/Dockerfile — Frontend build
- START_HERE.txt — Full documentation

---

**System Status: ✅ OPERATIONAL**

Happy deploying! 🚀
