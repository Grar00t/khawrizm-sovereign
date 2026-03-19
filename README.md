# 🇸🇦 KHAWRIZM — Sovereign AI Ecosystem

> **لا يوجد مستحيل في الدنيا — نحن ورثة الخوارزمي**

**KHAWRIZM** is a complete, self-hosted, sovereign AI ecosystem for enterprises and organizations that value independence, privacy, and control.

---

## 🎯 What is KHAWRIZM?

**KHAWRIZM** is:
- ✅ **Fully Sovereign** — No cloud lock-in, 100% self-hosted
- ✅ **Zero Telemetry** — Complete privacy, no tracking
- ✅ **Production-Ready** — Enterprise-grade infrastructure
- ✅ **Open Source Core** — MIT license for personal/educational use
- ✅ **Commercial Friendly** — Affordable licensing for businesses
- ✅ **Arabic-Native** — Designed for Arabic-speaking markets

---

## 🚀 Features

### Core Services
```
✅ Haven IDE           - Web-based development environment
✅ NIYAH Engine        - Sovereign AI chat interface
✅ Backend API         - Express.js REST API
✅ Database            - MariaDB relational database
✅ Ollama AI Engine    - Local model inference (Llama2, Mistral, DeepSeek, etc.)
```

### Technical Stack
```
Frontend: Next.js 15, React 19, Tailwind CSS
Backend: Express.js 4.18, Node.js 20
Database: MariaDB 11, SQLite
AI: Ollama (local inference), multiple models
DevOps: Docker, docker-compose
Security: AES-256-GCM, Ed25519, TLS 1.3
```

### Security & Compliance
```
✅ PDPL Compliant (Saudi Arabia)
✅ NIST Standards
✅ NCA-ECC Compatible
✅ Zero External Dependencies (except CDN)
✅ End-to-End Encryption
✅ Local-Only Data Processing
```

---

## 📦 Installation

### Quick Start (5 minutes)

```bash
# 1. Clone or download
git clone https://github.com/grar00t/khawrizm
cd khawrizm

# 2. Copy environment
cp .env.example .env

# 3. Edit .env with your settings
nano .env  # Change DB_ROOT_PASSWORD, DB_PASSWORD

# 4. Deploy
docker-compose up -d

# 5. Access
- Frontend: http://localhost:9002
- API: http://localhost:3000/health
- Database: localhost:3306
```

### Docker Requirements
```
✅ Docker 24.0+
✅ docker-compose 2.20+
✅ 4GB RAM minimum
✅ 10GB disk space
✅ Ports: 3000, 3306, 9002, 11434 available
```

---

## 💰 Pricing & Licensing

### Free Tier (MIT License)
```
✓ Full source code
✓ Community support
✓ Personal/educational use
✓ No commercial use
✓ Forever free
```

### Professional License ($99/month)
```
✓ Commercial use
✓ Up to 5 installations
✓ Email support (24-48h)
✓ Security updates
✓ Priority support
```

### Enterprise License ($499/month)
```
✓ Unlimited installations
✓ Dedicated support engineer
✓ Priority support (4h SLA)
✓ 99.9% uptime SLA
✓ Custom integrations
✓ Quarterly security audits
✓ On-premise deployment
```

### Consulting ($150/hour)
```
✓ Architecture design
✓ Custom development
✓ Integration support
✓ Training & workshops
✓ Performance optimization
```

**👉 [View Full Pricing](PRICING.html)**

---

## 📖 Documentation

### Getting Started
- [START_HERE.txt](START_HERE.txt) — Complete entry point
- [DEPLOYMENT_GUIDE.md](DEPLOYMENT_GUIDE.md) — Step-by-step setup
- [QUICK_COMMANDS.md](QUICK_COMMANDS.md) — Command reference

### Architecture & Technical
- [ARCHITECTURE_DIAGRAM.txt](ARCHITECTURE_DIAGRAM.txt) — Visual reference
- [API Documentation](2_Backend/server.js) — REST endpoints
- [Database Schema](init-db.sql) — SQL structure

### Legal & Licensing
- [LICENSE-COMMERCIAL.md](LICENSE-COMMERCIAL.md) — Commercial terms
- [LICENSE (MIT)](LICENSE) — Open source terms

---

## 🔧 Usage

### Access Haven IDE
```
Open: http://localhost:9002
Features:
  ✓ Web-based development environment
  ✓ Terminal integration
  ✓ File management
  ✓ Git integration
```

### Use the API
```bash
# Health check
curl http://localhost:3000/health

# Get API info
curl http://localhost:3000/api

# AI generation (with Ollama)
curl -X POST http://localhost:3000/api/ai/generate \
  -H "Content-Type: application/json" \
  -d '{"prompt":"What is KHAWRIZM?"}'
```

### Manage Services
```bash
# View status
docker-compose ps

# View logs
docker-compose logs -f

# Restart service
docker-compose restart backend

# Stop all
docker-compose down
```

---

## 🛡️ Security

### Built-In Security
```
✅ AES-256-GCM encryption
✅ Ed25519 cryptographic signatures
✅ Argon2 key derivation
✅ TLS 1.3 for transport
✅ Zero telemetry
✅ CORS configured
✅ Security headers (Helmet.js)
✅ Environment variable secrets
```

### Deployment Best Practices
```
1. Change default .env passwords
2. Use HTTPS in production (configure reverse proxy)
3. Enable firewall rules
4. Regular backups
5. Monitor logs
6. Keep images updated
```

---

## 📊 System Architecture

```
┌────────────────────────────────────────────────────┐
│                  User Browser                      │
├────────────────────────────────────────────────────┤
│                   Haven IDE (9002)                 │
│                    Next.js Frontend                │
├────────────────────────────────────────────────────┤
│              Backend API (3000)                    │
│              Express.js REST API                   │
├────────────────────────────────────────────────────┤
│  ┌──────────────────┬──────────────────────────┐  │
│  │ MariaDB (3306)   │ Ollama AI (11434)        │  │
│  │ Database         │ Local Model Inference    │  │
│  └──────────────────┴──────────────────────────┘  │
│                                                   │
│         All services on sovereign_network         │
└────────────────────────────────────────────────────┘
```

---

## 🚀 Production Deployment

### On Linux Server
```bash
# 1. SSH into server
ssh root@your-server

# 2. Clone project
git clone https://github.com/grar00t/khawrizm
cd khawrizm

# 3. Configure
cp .env.example .env
# Edit .env for production

# 4. Deploy
chmod +x deploy.sh
./deploy.sh

# 5. Configure reverse proxy (Nginx)
# ... (see DEPLOYMENT_GUIDE.md for full setup)
```

### With Kubernetes
```bash
# Coming soon! K8s manifests will be available
# for larger deployments
```

---

## 📞 Support

### Free Tier Support
- Community GitHub Issues
- Stack Overflow (tag: #khawrizm)
- Documentation

### Professional/Enterprise Support
- **Email:** support@khawrizm.com
- **Telegram:** (link in docs)
- **Response Time:** 
  - Professional: 24-48 hours
  - Enterprise: 4 hours (SLA)

### Contact
- **Website:** https://khawrizm.com
- **Email:** contact@khawrizm.com
- **Twitter:** @khawrzm
- **Company:** Ghala Rafaa Al-Omari Co.

---

## 💡 Contributing

### To the Open Source Project
```
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
```

**Note:** Commercial use of contributions requires a commercial license.

---

## 📈 Roadmap

### Q1 2026 (Current)
- ✅ Initial release with 5 core services
- ✅ Docker containerization
- ✅ Commercial licensing

### Q2 2026
- 🔄 K-Forge P2P VCS (undeletable Git)
- 🔄 Haven Browser
- 🔄 Advanced monitoring dashboard

### Q3 2026
- 🔄 Phalanx LSM (kernel-level telemetry block)
- 🔄 The Mesh (P2P network)
- 🔄 Kubernetes support

### Q4 2026
- 🔄 Mobile applications
- 🔄 Advanced AI features
- 🔄 Enterprise SaaS offering

---

## ⚖️ Legal

### Licensing
- **Free Tier:** MIT License (personal/educational)
- **Commercial:** Commercial License ($99-499/month)
- See [LICENSE-COMMERCIAL.md](LICENSE-COMMERCIAL.md) for details

### Compliance
- ✅ PDPL (Saudi Arabia)
- ✅ NCA-ECC Standards
- ✅ NIST Compliance
- ✅ GDPR Compatible (if deployed in EU)

### Disclaimer
```
THIS SOFTWARE IS PROVIDED "AS-IS" WITHOUT WARRANTY.
In no event shall we be liable for damages.
Use at your own risk.
```

---

## 🎉 Community

Join our community:
- **GitHub:** Star & watch for updates
- **Twitter:** @khawrzm
- **Email Newsletter:** https://khawrizm.com/subscribe

---

## 📝 Citation

If you use KHAWRIZM in your project, please cite:

```bibtex
@software{khawrizm2026,
  author = {Sulaiman Alshammari},
  title = {KHAWRIZM: Sovereign AI Ecosystem},
  year = {2026},
  url = {https://github.com/grar00t/khawrizm}
}
```

---

## 🙏 Acknowledgments

Built in Riyadh, Saudi Arabia 🇸🇦

Heritage of Al-Khwarizmi (الخوارزمي) — The father of algorithms.

> "لا يوجد مستحيل في الدنيا — نحن ورثة الخوارزمي"  
> *"There is nothing impossible in this world — We are heirs of Al-Khwarizmi"*

---

## 📄 License

- **Open Source Core:** MIT License (FREE for personal/educational)
- **Commercial:** See [LICENSE-COMMERCIAL.md](LICENSE-COMMERCIAL.md) ($99-499/month)

---

**Ready to build with sovereignty?**

👉 [Get Started Now](START_HERE.txt) | 👉 [View Pricing](PRICING.html) | 👉 [Contact Us](mailto:contact@khawrizm.com)

---

**© 2026 KHAWRIZM Sovereign Ecosystem**  
**Made by Ghala Rafaa Al-Omari Co.**  
**CR: 7050426415 | VAT: 313076120300003**
