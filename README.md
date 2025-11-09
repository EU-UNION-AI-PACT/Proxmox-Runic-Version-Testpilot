# ᚠᚢᚦᚨᚱᚲ Proxmox-Runic-Version-Testpilot

![Proxmox](https://img.shields.io/badge/Proxmox-VE-orange?style=for-the-badge&logo=proxmox)
![License](https://img.shields.io/badge/License-Apache%202.0-gold?style=for-the-badge)
![Scripts](https://img.shields.io/badge/Scripts-15+-blue?style=for-the-badge)
![Interactive](https://img.shields.io/badge/Dashboard-Interactive-green?style=for-the-badge)

**Runic-Coding-Version-Testpilot** - Ein umfassendes, interaktives Dashboard und Skript-Repository für Proxmox VE Management

---

## 🔮 Features

### 📊 **Interaktives Dashboard**
- **Live-Visualisierungen** mit Chart.js
- **6 Hauptmodule**: Übersicht, Skripte, Monitoring, Netzwerk, Speicher, Automation
- **Echtzeit-Statistiken** für CPU, RAM und Storage
- **Responsive Design** mit modernem Runic-Theme
- **Interaktive Buttons** für Quick Actions
- **Toggle-Switches** für Feature-Steuerung

### 📜 **15+ Automatisierungs-Skripte**

#### 🛠️ **Setup & Installation**
- `01-proxmenux-install.sh` - ProxmenuX Installation für erweiterte Menüsteuerung
- `02-post-install.sh` - Post-Installation Optimierung
- `03-kernel-clean.sh` - Kernel Cleanup & Wartung
- `interactive-setup.sh` - Interaktiver Setup-Assistent

#### 💾 **Backup & Updates**
- `04-host-backup.sh` - Automatische Host-Backups
- `05-lxc-updater.sh` - LXC Container Update Manager

#### 🚀 **Container & VMs**
- `06-container-examples.sh` - LXC Container Deployment
- `07-vm-examples.sh` - VM Deployment Templates

#### 📈 **Monitoring & Management**
- `08-monitoring-setup.sh` - Prometheus & Grafana Stack
- `09-network-config.sh` - Erweiterte Netzwerkkonfiguration (VLANs, Bridges)
- `10-storage-config.sh` - Storage Management (ZFS, NFS, Ceph)

#### 🎯 **Spezialisierte Stacks**
- `12-install-databases.sh` - PostgreSQL, MySQL, Redis
- `13-install-media-stack.sh` - Plex, Jellyfin, Sonarr, Radarr
- `14-install-security-stack.sh` - Vault, Firewall, IDS/IPS
- `15-install-homelab-essentials.sh` - Pi-hole, Portainer, Heimdall

---

## 🎨 Interaktive Visualisierungen

### **Dashboard Graphen**
- 📊 **Bar Chart** - Skript-Kategorien Übersicht
- 📈 **Line Chart** - CPU & Memory Performance über Zeit
- 🍩 **Doughnut Chart** - Netzwerk Traffic Verteilung
- 🎯 **Polar Area Chart** - Storage Verteilung
- 🕸️ **Radar Chart** - Automation Coverage

### **Live Monitoring**
- **Progress Bars** für Resource Usage (CPU, RAM, Storage)
- **Echtzeit-Updates** alle 3 Sekunden
- **Interaktive Stat-Cards** mit Hover-Effekten

---

## 🚀 Quick Start

### **1. Dashboard öffnen**
```bash
# Klonen des Repositories
git clone https://github.com/EU-UNION-AI-PACT/Proxmox-Runic-Version-Testpilot.git
cd Proxmox-Runic-Version-Testpilot

# Dashboard im Browser öffnen
firefox interactive-dashboard.html
# oder
chromium interactive-dashboard.html
```

### **2. Interaktiver Setup**
```bash
chmod +x interactive-setup.sh
./interactive-setup.sh
```

### **3. Einzelne Skripte ausführen**
```bash
chmod +x 01-proxmenux-install.sh
./01-proxmenux-install.sh
```

---

## 📖 Verwendung

### **Dashboard Navigation**
1. **📊 Übersicht** - Projekt-Statistiken und Quick Actions
2. **📜 Skripte** - Alle verfügbaren Skripte mit Beschreibungen
3. **📈 Monitoring** - Performance-Graphen und Resource Usage
4. **🌐 Netzwerk** - Netzwerk-Konfiguration und Traffic-Analyse
5. **💾 Speicher** - Storage Overview und Verteilung
6. **⚙️ Automation** - Geplante Tasks und Automation Pipeline

### **Interaktive Elemente**
- **Buttons**: Klickbar für Actions (Setup, Update, Logs, Export)
- **Graphen**: Hover für Details, responsive Darstellung
- **Toggle-Switches**: VLAN, Bridge Networking, IPv6 aktivieren/deaktivieren
- **Script-Items**: Klicken für detaillierte Informationen

---

## 🎯 Module Details

### **📊 Übersicht Modul**
- **4 Stat-Cards**: Skripte, Container, VMs, System Health
- **Bar Chart**: Skript-Kategorien Verteilung
- **Quick Actions**: Setup starten, Alles aktualisieren, Logs, Config Export

### **📜 Skripte Modul**
- **15 Script-Items** in Grid-Layout
- Jedes Item zeigt: Name, Beschreibung
- Click-Handler für Details

### **📈 Monitoring Modul**
- **Line Chart**: CPU & Memory Performance (24h)
- **3 Progress Bars**: Live CPU, Memory, Storage Usage
- Auto-Update alle 3 Sekunden

### **🌐 Netzwerk Modul**
- **Doughnut Chart**: Traffic-Verteilung (LAN/WAN/Internal/External)
- **3 Toggle-Switches**: VLAN, Bridge Networking, IPv6

### **💾 Speicher Modul**
- **Polar Area Chart**: Storage-Verteilung nach Typ
- **4 Stat-Cards**: Gesamt, Verwendet, Verfügbar, Dateisystem

### **⚙️ Automation Modul**
- **Radar Chart**: Automation Coverage (6 Dimensionen)
- **Task-Liste**: Geplante Tasks mit Zeitangaben

---

## 🛠️ Technologie Stack

- **Frontend**: HTML5, CSS3, Vanilla JavaScript
- **Charts**: Chart.js 4.4.0
- **Fonts**: Noto Sans Runic, Fira Code
- **Design**: Gradient Backgrounds, Glassmorphism, Animations
- **Backend**: Bash Scripts für Proxmox VE

---

## 🎨 Design Features

### **Visuelle Elemente**
- ✨ **Runic Gold Theme** (#d4af37)
- 🌌 **Dark Gradient Background** (#1a1a2e → #16213e)
- 💎 **Glassmorphism Cards** mit Backdrop-Filter
- 🌟 **Glow Animations** auf Titel
- 🎯 **Hover Effects** auf allen interaktiven Elementen
- 📱 **Responsive Grid Layouts**

### **Animationen**
- **fadeIn** beim Modul-Wechsel
- **Ripple Effect** auf Buttons
- **Pulsing Glow** auf Überschrift
- **Smooth Transitions** auf allen Elementen

---

## 📋 Dokumentation

- **00-README.md** - Basis-Einführung
- **MASTER-GUIDE.md** - Umfassende Anleitung
- **CHEAT-SHEET.txt** - Schnell-Referenz
- **11-community-scripts-overview.md** - Community Scripts

---

## 🔐 Sicherheit

- ✅ Alle Skripte mit Fehlerbehandlung
- ✅ Backup-Funktionen integriert
- ✅ Sudo-Berechtigungen erforderlich
- ✅ Logging aktiviert

---

## 🤝 Beitragen

Contributions sind willkommen! Bitte:
1. Fork das Repository
2. Erstelle einen Feature Branch
3. Committe deine Änderungen
4. Push zum Branch
5. Öffne einen Pull Request

---

## 📜 Lizenz

Apache License 2.0 - siehe [LICENSE](LICENSE)

---

## 🌟 Highlights

- 🎯 **15+ Production-Ready Skripte**
- 📊 **6 Interaktive Module**
- 📈 **5 Chart-Typen** (Bar, Line, Doughnut, Polar, Radar)
- ⚡ **Live Updates** & Real-time Stats
- 🎨 **Modernes Runic Design**
- 📱 **Fully Responsive**
- 🔮 **Chart.js Integration**
- ⚙️ **Automation-ready**

---

## 🔗 Links

- **GitHub**: [EU-UNION-AI-PACT/Proxmox-Runic-Version-Testpilot](https://github.com/EU-UNION-AI-PACT/Proxmox-Runic-Version-Testpilot)
- **Proxmox VE**: [proxmox.com](https://www.proxmox.com)
- **Chart.js**: [chartjs.org](https://www.chartjs.org)

---

## 📸 Screenshots

### Dashboard Übersicht
- Stat-Cards mit Live-Daten
- Interaktive Graphen
- Quick Action Buttons

### Module
- 6 spezialisierte Module
- Jeweils mit Charts und Controls
- Smooth Navigation

---

## 🎓 Verwendete Technologien

| Technologie | Verwendung |
|------------|------------|
| **Chart.js** | Alle Graphen und Visualisierungen |
| **CSS Grid** | Responsive Layouts |
| **CSS Animations** | Smooth Transitions |
| **Vanilla JS** | Interaktivität |
| **Bash** | Automatisierung |
| **Proxmox API** | System Integration |

---

## 🔮 Runic Theme

Inspiriert von nordischen Runen (ᚠᚢᚦᚨᚱᚲ - FUTHARK) für ein mystisches, professionelles Look & Feel.

**Farbschema:**
- Gold: `#d4af37` (Primary)
- Dark Blue: `#1a1a2e` (Background)
- Accent Blue: `#0f3460` (Secondary)

---

**Made with ᚠᚢᚦᚨᚱᚲ by EU-UNION-AI-PACT**

🌟 Star us on GitHub!
