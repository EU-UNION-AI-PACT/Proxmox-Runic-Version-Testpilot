# 🚀 Proxmox Community Scripts - Master Installation Guide

## 📦 Was du gerade bekommen hast

Eine komplette Sammlung von **200+ Community Scripts** für Proxmox VE, organisiert in praktische Installer-Scripts.

**Alle Dateien befinden sich in:** `/tmp/proxmox-scripts/`

---

## 📁 Datei-Übersicht

### 📖 Dokumentation
- `00-README.md` - Basis-README (vorherige Scripts)
- `11-community-scripts-overview.md` - **Vollständige Übersicht aller 200+ Scripts** ⭐

### 🔧 Basis-Scripts (01-10)
Grundlegende Proxmox-Wartung und -Konfiguration (bereits vorhanden)

### 🎯 Quick-Install Scripts (12-15)
- `12-install-databases.sh` - **Datenbank-Installer** (12 DBs)
- `13-install-media-stack.sh` - **Arr Stack** (20+ Apps)
- `14-install-security-stack.sh` - **Security & Auth** (15+ Tools)
- `15-install-homelab-essentials.sh` - **Homelab Essentials** (8 Stacks)

---

## 🎯 Schnellstart

### 1️⃣ Alle Dateien auf Proxmox kopieren
```bash
# Auf deinem lokalen System:
scp -r /tmp/proxmox-scripts root@PROXMOX-IP:/root/

# Oder direkt auf Proxmox:
cd /root
git clone https://github.com/community-scripts/ProxmoxVE.git
# Dann unsere Scripts dazu kopieren
```

### 2️⃣ Interaktive Installer verwenden
```bash
# Auf Proxmox Shell:
cd /root/proxmox-scripts

# Datenbanken installieren:
./12-install-databases.sh

# Media Server aufsetzen:
./13-install-media-stack.sh

# Security Stack:
./14-install-security-stack.sh

# Komplettes Homelab:
./15-install-homelab-essentials.sh
```

### 3️⃣ Einzelne Apps direkt installieren
```bash
# Beispiele aus der Overview (11-community-scripts-overview.md):

# Docker LXC:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"

# Nextcloud VM:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/nextcloud-vm.sh)"

# Nginx Proxy Manager:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nginxproxymanager.sh)"
```

---

## 🎬 Beliebte Stacks

### 🏠 **Starter Homelab**
```bash
# 1. Docker Container Platform
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"

# 2. Nginx Proxy Manager
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nginxproxymanager.sh)"

# 3. Pi-hole DNS
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pihole.sh)"

# 4. Portainer (optional, falls gewünscht)
# Wird meist in Docker Container selbst installiert
```

### 🎬 **Media Server Complete**
```bash
# Oder einfach:
./13-install-media-stack.sh
# Wähle Option 1 (Complete Stack)

# Installiert:
# - Prowlarr (Indexer Manager)
# - Radarr (Movies)
# - Sonarr (TV Shows) - manuell nachinstallieren falls gewünscht
# - Lidarr (Music)
# - Bazarr (Subtitles)
# - Overseerr (Request Management)
# - Recyclarr, Autobrr, FlareSolverr, etc.
```

### 🔐 **Security First**
```bash
./14-install-security-stack.sh
# Wähle Option 1 (Complete Security Stack)

# Installiert:
# - Vaultwarden (Password Manager)
# - Authelia (SSO/2FA)
# - 2FAuth (TOTP)
# - LLDAP (User Management)
# - CrowdSec (IPS/IDS)
```

### 💾 **Database Server**
```bash
./12-install-databases.sh
# Wähle Option A (Standard Stack)

# Installiert:
# - PostgreSQL
# - MariaDB
# - Redis
```

---

## 📊 Die beliebtesten Apps

### Top 10 Must-Have Container
1. **Docker** - Container Platform
2. **Nginx Proxy Manager** - Reverse Proxy mit GUI
3. **Pi-hole** - DNS Ad-Blocker
4. **Nextcloud** - Private Cloud
5. **Vaultwarden** - Password Manager
6. **Grafana** - Monitoring Dashboards
7. **PostgreSQL** - Database
8. **Gitea** - Git Server
9. **Uptime Kuma** - Uptime Monitoring
10. **Home Assistant** - Home Automation

### Media Server Essentials
- Jellyfin/Plex/Emby - Media Player
- Radarr - Movie Management
- Sonarr - TV Show Management
- Prowlarr - Indexer Manager
- Overseerr - Request Management
- Bazarr - Subtitle Management

### Development Tools
- Gitea/Forgejo - Git Hosting
- Jenkins - CI/CD
- Code Server - VS Code in Browser
- n8n - Workflow Automation
- PostgreSQL - Database
- Redis - Cache

---

## 🗂️ Alle Kategorien im Überblick

Siehe **`11-community-scripts-overview.md`** für die vollständige Liste!

### Hauptkategorien:
- 📊 **Datenbanken & Storage** (17)
- 📈 **Monitoring & Analytics** (3)
- 🏠 **Home Automation** (7)
- 🤖 **AI & Automation** (6)
- 🔧 **DevOps & Development** (10)
- 🌐 **Reverse Proxy & Web** (6)
- 🔐 **Security & Auth** (15)
- 🌐 **DNS & Network** (11)
- 📺 **Media Management** (20+)
- 💼 **Business & Productivity** (25)
- 💰 **Finance & Budget** (5)
- 🐳 **Container Management** (7)
- 🖥️ **VMs & OS Templates** (10)
- 🛠️ **Tools & Utilities** (15)
- 📞 **Communication** (7)
- 🏡 **Self-Hosted Platforms** (8)

**Gesamt: 200+ Scripts!**

---

## 💡 Pro-Tipps

### Best Practices
1. **Plane vor der Installation**
   - Überlege welche Services du wirklich brauchst
   - Prüfe Hardware-Ressourcen (RAM/CPU/Storage)
   - Plane IP-Adressen und Netzwerk

2. **Backup vor Installation**
   ```bash
   # Proxmox Backup erstellen
   ./04-host-backup.sh
   ```

3. **Container organisieren**
   - Nutze sinnvolle Container-IDs (z.B. 200er für Docker, 300er für Media)
   - Verwende Tags in Proxmox
   - Dokumentiere deine Installation

4. **Nach Installation**
   - Erstelle sofort ein Backup des konfigurierten Containers
   - Aktiviere automatische Updates
   - Richte Monitoring ein

### Ressourcen-Planung

#### Minimale Server-Specs für Homelab:
- **CPU:** 4 Cores (besser 6-8)
- **RAM:** 16 GB (besser 32 GB)
- **Storage:** 500 GB SSD + optional HDD für Media

#### Typische RAM-Zuweisungen:
- **Micro Services:** 512 MB - 1 GB (Pi-hole, Authelia)
- **Standard Apps:** 2-4 GB (Nextcloud, Gitea, NPM)
- **Databases:** 4-8 GB (PostgreSQL, MariaDB)
- **Heavy Apps:** 8-16 GB (Keycloak, Nextcloud großes Setup)
- **Media Processing:** 8-16 GB (Plex, Emby, Transcoding)

---

## 🔗 Wichtige Links

- **Community Scripts Repo:** https://github.com/community-scripts/ProxmoxVE
- **Proxmox Forum:** https://forum.proxmox.com/
- **Proxmox Docs:** https://pve.proxmox.com/pve-docs/
- **Proxmox Helper Scripts:** https://tteck.github.io/Proxmox/

---

## 🆘 Troubleshooting

### Script schlägt fehl?
1. Prüfe Internet-Verbindung
2. Stelle sicher dass genug Storage verfügbar ist
3. Prüfe ob Container-ID bereits vergeben
4. Schaue in Proxmox Logs: `journalctl -xe`

### Container startet nicht?
1. Prüfe RAM-Zuweisung
2. Prüfe Kernel-Version (manche Apps brauchen neueren Kernel)
3. Schaue Container-Logs in Proxmox GUI

### App nicht erreichbar?
1. Prüfe Firewall (Proxmox Host + Container)
2. Prüfe ob Service läuft: `systemctl status SERVICE`
3. Prüfe Ports: `netstat -tulpn | grep PORT`

---

## 📝 Was jetzt?

### Empfohlener Start:
1. **Lies die Overview:** `11-community-scripts-overview.md`
2. **Wähle einen Stack:** z.B. Homelab Essentials
3. **Führe Installer aus:** `./15-install-homelab-essentials.sh`
4. **Konfiguriere Services:** Folge den Post-Install Anweisungen
5. **Backup erstellen:** Nach erfolgreicher Konfiguration

### Nächste Schritte:
- Richte Reverse Proxy ein (NPM)
- Konfiguriere SSL-Zertifikate
- Aktiviere Monitoring
- Erstelle Backup-Strategy
- Dokumentiere dein Setup

---

## 🎯 Viel Erfolg mit deinem Proxmox Homelab! 🚀

**Tipp:** Starte klein, erweitere nach Bedarf. Nicht alle 200 Scripts auf einmal! 😄
