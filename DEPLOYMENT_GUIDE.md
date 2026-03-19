# 🚀 SOVEREIGN ECOSYSTEM - DEPLOYMENT GUIDE

Complete guide to deploying the Sovereign Ecosystem using Docker.

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Installation](#installation)
3. [Configuration](#configuration)
4. [Deployment](#deployment)
5. [Verification](#verification)
6. [Monitoring](#monitoring)
7. [Troubleshooting](#troubleshooting)

## Prerequisites

### System Requirements
- Docker: v24.0+
- Docker Compose: v2.20+
- RAM: 4GB minimum (8GB recommended)
- Storage: 10GB free space
- OS: Linux, macOS, or Windows 10/11 Pro

### Check Installation
```bash
docker --version
docker-compose --version
```

## Installation

### 1. Clone/Download the Project
```bash
# Navigate to your projects folder
cd ~/projects
```

### 2. Verify Structure
```bash
ls -la Sovereign_Ecosystem/

# Expected output:
# 1_Frontend/
# 2_Backend/
# 3_Core_Engines/
# docker-compose.yml
# .env.example
# deploy.sh (or deploy.ps1 for Windows)
```

## Configuration

### 1. Create Environment File
```bash
cd Sovereign_Ecosystem
cp .env.example .env
```

### 2. Edit .env
```bash
nano .env  # or use your editor
```

**Critical Settings:**
```env
# Database - CHANGE THESE!
DB_ROOT_PASSWORD=secure-root-password-here
DB_USER=sovereign_user
DB_PASSWORD=secure-db-password-here
DB_NAME=sovereign_db

# Backend
NODE_ENV=production
PORT=3000

# Frontend
NEXT_PUBLIC_API_URL=http://localhost:3000
```

### 3. Verify Backend Dependencies
```bash
cd 2_Backend
npm init -y  # If package.json doesn't exist
npm install express mysql2 dotenv cors helmet morgan
cd ..
```

### 4. Verify Frontend Dependencies
```bash
cd 3_Core_Engines/Haven_IDE
npm install  # or npm ci if package-lock exists
cd ../../..
```

## Deployment

### Option A: Linux/macOS (Bash Script)
```bash
chmod +x deploy.sh
./deploy.sh
```

### Option B: Windows (PowerShell Script)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
./deploy.ps1
```

### Option C: Manual Deployment (All Platforms)
```bash
# 1. Build images
docker-compose build --no-cache

# 2. Start services
docker-compose up -d

# 3. Verify
docker-compose ps
```

## Verification

### 1. Check All Services Running
```bash
docker-compose ps

# Expected: All containers showing "Up"
```

### 2. Test API Health
```bash
curl http://localhost:3000/health

# Expected:
# {
#   "status": "healthy",
#   "timestamp": "2024-...",
#   "version": "1.0.0"
# }
```

### 3. Access Frontend
```
Browser: http://localhost:9002
```

### 4. Check Database
```bash
docker exec -it sovereign_mariadb mysql -u sovereign_user -p sovereign_db

# In MySQL shell:
mysql> SELECT * FROM config;
mysql> exit
```

### 5. Test AI Engine (Ollama)
```bash
curl http://localhost:11434/api/tags

# Or in browser:
# http://localhost:11434/api/tags
```

## Monitoring

### View Live Logs
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f haven_ide
docker-compose logs -f mariadb
docker-compose logs -f ollama
```

### Resource Usage
```bash
# Real-time stats
docker stats

# Container details
docker inspect sovereign_backend
```

### Database Status
```bash
docker exec sovereign_mariadb mysql -u root -p -e "SHOW PROCESSLIST;"
```

## Troubleshooting

### Issue: "Port already in use"
```bash
# Find what's using the port (Linux/Mac)
lsof -i :3000  # for port 3000

# Free the port or change in .env
```

### Issue: "Cannot connect to Docker daemon"
```bash
# Ensure Docker is running
docker --version

# On Linux
sudo systemctl start docker

# On macOS
# Restart Docker Desktop
```

### Issue: "Database connection refused"
```bash
# Check MariaDB logs
docker-compose logs mariadb

# Verify DB is healthy
docker-compose ps mariadb
```

### Issue: "Out of memory"
```bash
# Increase Docker memory in Docker Desktop settings
# Or limit container memory in docker-compose.yml:
# services:
#   mariadb:
#     deploy:
#       resources:
#         limits:
#           memory: 2G
```

### Issue: "Build fails - npm install"
```bash
# Clear npm cache
docker-compose build --no-cache --pull

# Or manually fix:
cd 2_Backend
rm -rf node_modules package-lock.json
npm install
cd ../..
docker-compose build
```

### Issue: "Frontend won't connect to API"
```bash
# Check API is running
curl http://localhost:3000/health

# Verify network connectivity
docker exec sovereign_haven_ide curl http://backend:3000/health
```

## Common Commands

### Stop Everything
```bash
docker-compose down
```

### Restart Specific Service
```bash
docker-compose restart backend
docker-compose restart haven_ide
```

### View Logs with Tail
```bash
docker-compose logs -f --tail=50 backend
```

### Access Service Shell
```bash
docker exec -it sovereign_backend /bin/sh
docker exec -it sovereign_haven_ide /bin/sh
```

### Clean Up (Warning: Removes data)
```bash
docker-compose down -v  # Removes volumes too!
```

### Update Images
```bash
docker-compose pull
docker-compose build --pull --no-cache
```

## Performance Tips

1. **Use bind mounts for development:**
   ```yaml
   volumes:
     - ./2_Backend:/app
   ```

2. **Limit log size:**
   ```bash
   docker-compose logs --tail=1000
   ```

3. **Monitor resource usage:**
   ```bash
   docker stats --no-stream
   ```

## Security Checklist

- [ ] Changed all default passwords in .env
- [ ] .env file is in .gitignore
- [ ] Enabled HTTPS in production (nginx reverse proxy)
- [ ] Set NODE_ENV=production
- [ ] Configured firewall rules
- [ ] Regular backups of database volume
- [ ] Updated base images regularly

## Production Deployment

For production, add to docker-compose.yml:

```yaml
services:
  backend:
    environment:
      NODE_ENV: production
    restart: always
    deploy:
      resources:
        limits:
          cpus: '2'
          memory: 2G
      update_config:
        parallelism: 1
        delay: 10s
```

## Next Steps

1. ✅ Verify all services running
2. 📊 Check dashboard at http://localhost:9002
3. 🔌 Test API endpoints
4. 🤖 Configure AI models in Ollama
5. 📝 Populate database with initial data
6. 🔐 Set up backups

---

**Need Help?**
- Check logs: `docker-compose logs -f`
- Review README.md for architecture
- Inspect docker-compose.yml for configuration

