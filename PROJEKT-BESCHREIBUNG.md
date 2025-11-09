# 🔮 ᚠᚢᚦᚨᚱᚲ Proxmox Runic Version Testpilot - Ausführliche Projektbeschreibung

## 📋 Inhaltsverzeichnis
- [Projektübersicht](#projektübersicht)
- [Interaktives Dashboard](#interaktives-dashboard)
- [Skript-Bibliothek](#skript-bibliothek)
- [Technische Architektur](#technische-architektur)
- [Installation & Deployment](#installation--deployment)
- [Verwendungsszenarien](#verwendungsszenarien)
- [Sicherheit & Best Practices](#sicherheit--best-practices)
- [Entwicklung & Beiträge](#entwicklung--beiträge)

---

## 🎯 Projektübersicht

### Vision & Zielsetzung
Das **Proxmox Runic Version Testpilot** Projekt ist eine umfassende Management- und Automatisierungslösung für Proxmox Virtual Environment (VE). Es kombiniert moderne Web-Technologien mit leistungsstarken Bash-Skripten, um eine intuitive, visuelle Schnittstelle für die Verwaltung von Proxmox-Hosts, Containern und virtuellen Maschinen bereitzustellen.

### Kernziele
1. **Automatisierung**: Reduzierung manueller Aufgaben durch intelligente Skripte
2. **Visualisierung**: Bereitstellung einer ansprechenden, informativen Dashboard-Oberfläche
3. **Effizienz**: Schnelle Deployment-Prozesse für häufige Infrastruktur-Komponenten
4. **Bildung**: Lernressource für Proxmox-Best-Practices
5. **Gemeinschaft**: Open-Source-Plattform für kollaborative Weiterentwicklung

### Zielgruppen
- **Homelab-Enthusiasten**: Privatanwender, die ihre eigene virtuelle Infrastruktur aufbauen
- **IT-Administratoren**: Profis, die Proxmox in Unternehmensumgebungen verwalten
- **DevOps-Engineers**: Teams, die automatisierte Deployment-Pipelines benötigen
- **Lernende**: Personen, die Virtualisierung und Container-Technologie erlernen möchten
- **MSPs**: Managed Service Provider für effiziente Kundenverwaltung

---

## 📊 Interaktives Dashboard

### Architektur des Dashboards

#### Frontend-Technologien
```
├── HTML5
│   ├── Semantic Markup
│   ├── Accessibility Features (ARIA)
│   └── Progressive Enhancement
│
├── CSS3
│   ├── CSS Grid & Flexbox
│   ├── CSS Variables (Custom Properties)
│   ├── Animations & Transitions
│   ├── Media Queries (Responsive Design)
│   └── Backdrop Filters (Glassmorphism)
│
└── JavaScript (Vanilla ES6+)
    ├── DOM Manipulation
    ├── Event Handling
    ├── Async Operations
    ├── Chart.js Integration
    └── Real-time Data Simulation
```

### Dashboard-Module im Detail

#### 1️⃣ Übersicht-Modul
**Zweck**: Zentrale Anlaufstelle für schnelle System-Übersicht

**Komponenten**:
- **Stat-Cards** (4 Karten)
  - Verfügbare Skripte: Zählt alle ausführbaren .sh-Dateien
  - LXC Container: Anzahl aktiver Container (dynamisch)
  - Virtuelle Maschinen: Anzahl aktiver VMs (dynamisch)
  - System Health: Gesamtstatus-Indikator (100% = optimal)

- **Bar Chart**: Skript-Kategorien
  - X-Achse: Setup, Container, VMs, Monitoring, Network, Storage
  - Y-Achse: Anzahl der Skripte pro Kategorie
  - Farbe: Runic Gold (#d4af37)
  - Interaktivität: Hover zeigt genaue Zahlen

- **Quick Actions**
  - ▶️ Setup Starten: Führt interactive-setup.sh aus
  - 🔄 Alles Aktualisieren: Mass-Update für alle Container/VMs
  - 📋 Logs Anzeigen: Öffnet aggregierte Logs
  - 💾 Config Exportieren: Sichert aktuelle Konfigurationen

**Technische Details**:
```javascript
// Stat-Card Updates (Live)
function updateStatCards() {
    fetch('/api/stats')
        .then(res => res.json())
        .then(data => {
            document.getElementById('scriptCount').textContent = data.scripts;
            document.getElementById('containerCount').textContent = data.containers;
            document.getElementById('vmCount').textContent = data.vms;
        });
}
```

#### 2️⃣ Skripte-Modul
**Zweck**: Zentrale Verwaltung aller Automatisierungsskripte

**15+ Verfügbare Skripte**:

| # | Skript | Kategorie | Beschreibung | Use-Case |
|---|--------|-----------|--------------|----------|
| 01 | proxmenux-install.sh | Setup | ProxmenuX Installation | Erweiterte CLI-Navigation |
| 02 | post-install.sh | Setup | Post-Install Config | Optimierung nach Fresh Install |
| 03 | kernel-clean.sh | Wartung | Kernel Cleanup | Speicherplatz freigeben |
| 04 | host-backup.sh | Backup | Host Sicherung | Disaster Recovery |
| 05 | lxc-updater.sh | Updates | Container Updates | Automatische Patch-Verwaltung |
| 06 | container-examples.sh | Deployment | LXC Templates | Schnelle Container-Erstellung |
| 07 | vm-examples.sh | Deployment | VM Templates | Vorkonfigurierte VMs |
| 08 | monitoring-setup.sh | Monitoring | Prometheus/Grafana | Umfassendes Monitoring |
| 09 | network-config.sh | Netzwerk | VLAN/Bridge Setup | Erweiterte Netzwerk-Konfiguration |
| 10 | storage-config.sh | Storage | ZFS/NFS/Ceph | Storage-Pool Management |
| 12 | install-databases.sh | Stack | DB Installation | PostgreSQL, MySQL, Redis |
| 13 | install-media-stack.sh | Stack | Media Server | Plex, Jellyfin, Arr-Suite |
| 14 | install-security-stack.sh | Stack | Security Tools | Vault, Firewall, IDS |
| 15 | install-homelab-essentials.sh | Stack | Homelab Basics | Pi-hole, Portainer |
| -- | interactive-setup.sh | Meta | Guided Setup | Schritt-für-Schritt Wizard |

**Script-Item Features**:
- Grid-Layout: Responsive, 3 Spalten auf Desktop
- Hover-Effekte: Translatet X-Achse um 5px, Background-Glow
- Click-Handler: Öffnet Details-Modal mit:
  - Vollständige Skript-Beschreibung
  - Erforderliche Parameter
  - Geschätzte Ausführungszeit
  - Ausführungsprotokoll
  - Start-Button für direkte Ausführung

#### 3️⃣ Monitoring-Modul
**Zweck**: Echtzeit-Überwachung von System-Ressourcen

**Line Chart - Performance über Zeit**:
- **Zeitraum**: 24 Stunden (6 Datenpunkte)
- **Metriken**:
  - CPU-Auslastung (%) - Goldene Linie
  - RAM-Nutzung (%) - Blaue Linie
- **Update-Intervall**: Alle 3 Sekunden
- **Datenquelle**: Mock-Daten (Produktion: Proxmox API)

**Progress Bars - Live Resources**:
```css
.progress-bar {
    /* Container */
    width: 100%;
    height: 30px;
    background: rgba(0, 0, 0, 0.3);
    border-radius: 15px;
}

.progress-fill {
    /* Füllbalken */
    height: 100%;
    background: linear-gradient(90deg, #d4af37, #c99c2e);
    transition: width 1s ease; /* Smooth Animation */
}
```

**Monitoring-Metriken**:
1. CPU Usage: 30-75% (typischer Bereich)
2. Memory Usage: 50-70% (optimal für Caching)
3. Storage Usage: 35-45% (gesunder Füllgrad)

**Erweiterungsmöglichkeiten**:
- Integration mit Prometheus
- Grafana-Dashboards einbetten
- Alert-Benachrichtigungen
- Historische Datenanalyse

#### 4️⃣ Netzwerk-Modul
**Zweck**: Visualisierung und Steuerung der Netzwerk-Infrastruktur

**Doughnut Chart - Traffic-Verteilung**:
- **Segmente**:
  - LAN Traffic: 45% (Interne Kommunikation)
  - WAN Traffic: 25% (Internet-Zugriff)
  - Internal: 20% (Container-zu-Container)
  - External: 10% (Externe APIs)

**Toggle-Switches - Feature Control**:
1. **VLAN Support** (Default: ON)
   - Aktiviert: VLAN-Tags in Netzwerk-Interfaces
   - Deaktiviert: Flat Network ohne Segmentierung
   
2. **Bridge Networking** (Default: ON)
   - Aktiviert: vmbr0, vmbr1 Bridges
   - Deaktiviert: NAT-only Mode
   
3. **IPv6** (Default: OFF)
   - Aktiviert: Dual-Stack (IPv4 + IPv6)
   - Deaktiviert: IPv4-only

**Netzwerk-Topologie Beispiel**:
```
┌─────────────────────────────────────┐
│   Proxmox Host (192.168.1.100)     │
├─────────────────────────────────────┤
│  vmbr0 (Bridge) - LAN              │
│  ├─ VLAN 10 (Management)           │
│  ├─ VLAN 20 (Productive)           │
│  └─ VLAN 30 (DMZ)                  │
│                                     │
│  vmbr1 (Bridge) - Storage Network  │
│  └─ 10.0.0.0/24                    │
└─────────────────────────────────────┘
```

#### 5️⃣ Speicher-Modul
**Zweck**: Storage-Management und Kapazitätsplanung

**Polar Area Chart - Storage-Verteilung**:
- **Kategorien**:
  - Backups: 400 GB (größter Anteil)
  - VMs: 300 GB (VM-Images)
  - Containers: 150 GB (LXC-Rootfs)
  - ISOs: 50 GB (Installation-Medien)
  - Templates: 50 GB (Container/VM-Templates)

**Stat-Cards - Kapazität**:
1. **Gesamt Speicher**: 2.5 TB
   - Physische Disks: 3x 1TB in RAID-Z1
   
2. **Verwendet**: 950 GB
   - Effektive Nutzung: 38%
   
3. **Verfügbar**: 1.55 TB
   - Freier Platz für Expansion
   
4. **Dateisystem**: ZFS
   - Features: Compression, Snapshots, Deduplication

**ZFS-Features im Detail**:
```bash
# Compression Ratio
zfs get compression,compressratio tank/proxmox

# Snapshots
zfs snapshot tank/proxmox@backup-$(date +%Y%m%d)

# Deduplication
zfs set dedup=on tank/proxmox
```

#### 6️⃣ Automation-Modul
**Zweck**: Orchestrierung automatisierter Workflows

**Radar Chart - Automation Coverage**:
- **6 Dimensionen** (0-100%):
  - Backups: 90% (Tägliche automatische Backups)
  - Updates: 75% (Wöchentliche Patch-Verwaltung)
  - Monitoring: 85% (Prometheus/Grafana aktiv)
  - Cleanup: 70% (Log-Rotation, Temp-Files)
  - Security: 80% (Firewall-Rules, Updates)
  - Optimization: 65% (Kernel-Tuning, Cache)

**Geplante Tasks** (Cron-Jobs):
```bash
# /etc/crontab
0 2 * * * root /scripts/04-host-backup.sh       # Tägliches Backup
0 3 * * 0 root /scripts/05-lxc-updater.sh      # Sonntag Updates
0 4 * * 1 root /scripts/03-kernel-clean.sh     # Montag Cleanup
*/60 * * * * root /scripts/health-check.sh     # Stündlicher Health-Check
```

### Design-System

#### Farbpalette
```css
:root {
    /* Primary Colors */
    --primary-gold: #d4af37;      /* Runic Gold */
    --secondary-gold: #c99c2e;    /* Darker Gold */
    
    /* Background Colors */
    --dark-bg: #1a1a2e;           /* Main Background */
    --darker-bg: #16213e;         /* Gradient End */
    --accent-blue: #0f3460;       /* Cards/Accents */
    
    /* Text Colors */
    --text-light: #e4e4e4;        /* Primary Text */
    --text-muted: #a0a0a0;        /* Secondary Text */
    
    /* Glassmorphism */
    --glass-bg: rgba(255, 255, 255, 0.05);
    --glass-border: rgba(212, 175, 55, 0.2);
}
```

#### Typografie
```css
/* Headings - Runic Style */
h1, h2, h3 {
    font-family: 'Noto Sans Runic', sans-serif;
    background: linear-gradient(45deg, var(--primary-gold), #f4e4c1);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
}

/* Code - Monospace */
.script-name, .stat-value {
    font-family: 'Fira Code', monospace;
}

/* Body - Sans-Serif */
body, p, .card-desc {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}
```

#### Animationen & Effekte
```css
/* Glow Animation auf Titel */
@keyframes glow {
    0%, 100% { filter: drop-shadow(0 0 10px rgba(212, 175, 55, 0.3)); }
    50% { filter: drop-shadow(0 0 20px rgba(212, 175, 55, 0.6)); }
}

/* Fade-In beim Modul-Wechsel */
@keyframes fadeIn {
    from { 
        opacity: 0; 
        transform: translateY(20px); 
    }
    to { 
        opacity: 1; 
        transform: translateY(0); 
    }
}

/* Ripple Effect auf Buttons */
.nav-btn::before {
    content: '';
    position: absolute;
    border-radius: 50%;
    background: rgba(212, 175, 55, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
}

.nav-btn:hover::before {
    width: 300px;
    height: 300px;
}
```

### Responsive Design

#### Breakpoints
```css
/* Mobile First Approach */

/* Small Devices (Phones, < 768px) */
@media (max-width: 767px) {
    .stats-grid {
        grid-template-columns: 1fr;
    }
    .nav-buttons {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* Medium Devices (Tablets, 768px - 1024px) */
@media (min-width: 768px) and (max-width: 1024px) {
    .stats-grid {
        grid-template-columns: repeat(2, 1fr);
    }
}

/* Large Devices (Desktops, > 1024px) */
@media (min-width: 1025px) {
    .stats-grid {
        grid-template-columns: repeat(4, 1fr);
    }
}
```

---

## 📜 Skript-Bibliothek

### Kategorie: Setup & Installation

#### 01-proxmenux-install.sh
**Beschreibung**: Installation des ProxmenuX Tools für erweiterte Terminal-Navigation

**Features**:
- Automatischer Download von GitHub
- Dependency-Check (curl, git)
- Systemd-Service Integration
- Konfigurationsdatei-Setup

**Verwendung**:
```bash
chmod +x 01-proxmenux-install.sh
./01-proxmenux-install.sh
```

**Parameter**: Keine erforderlich

**Ausgabe**:
```
[INFO] ProxmenuX Installation gestartet...
[OK] Dependencies installiert
[OK] ProxmenuX heruntergeladen
[OK] Service registriert
[SUCCESS] Installation abgeschlossen!
```

#### 02-post-install.sh
**Beschreibung**: Post-Installation Optimierungen nach Proxmox Fresh Install

**Optimierungen**:
1. **Repository-Konfiguration**
   - Entfernt Enterprise-Repos (ohne Lizenz)
   - Fügt Community-Repos hinzu
   - Aktualisiert Package-Listen

2. **System-Updates**
   - apt update && apt upgrade
   - apt dist-upgrade (Kernel-Updates)
   - pve-headers Installation

3. **Performance-Tuning**
   - Swappiness auf 10 setzen
   - I/O-Scheduler auf mq-deadline
   - Transparent Huge Pages deaktivieren

4. **Sicherheits-Hardening**
   - SSH-Root-Login deaktivieren
   - Fail2ban Installation
   - Firewall-Basis-Regeln

**Code-Beispiel**:
```bash
#!/bin/bash

# Repository Fix
echo "deb http://download.proxmox.com/debian/pve bullseye pve-no-subscription" > \
    /etc/apt/sources.list.d/pve-no-subscription.list

# Swappiness
echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl -p

# Firewall
pve-firewall enable
pve-firewall compile
```

#### 03-kernel-clean.sh
**Beschreibung**: Bereinigung alter Kernel-Versionen zur Speicherplatz-Freigabe

**Funktionen**:
- Erkennt installierte Kernel
- Behält aktuellen + vorherigen Kernel
- Löscht ältere Versionen
- Aktualisiert GRUB-Config

**Sicherheitsmechanismen**:
```bash
CURRENT_KERNEL=$(uname -r)
INSTALLED_KERNELS=$(dpkg -l | grep 'pve-kernel-' | awk '{print $2}')

# Niemals aktuellen Kernel löschen
for kernel in $INSTALLED_KERNELS; do
    if [[ "$kernel" != *"$CURRENT_KERNEL"* ]]; then
        apt remove --purge -y "$kernel"
    fi
done
```

#### interactive-setup.sh
**Beschreibung**: Interaktiver Wizard für komplette Proxmox-Konfiguration

**Setup-Phasen**:
1. **Begrüßung & System-Check**
   - Proxmox-Version validieren
   - Hardware-Ressourcen prüfen
   - Netzwerk-Konnektivität testen

2. **Repository-Auswahl**
   - Enterprise vs. No-Subscription
   - Testing-Repos (optional)
   - Ceph-Repos (bei Storage-Setup)

3. **Netzwerk-Konfiguration**
   - Bridge-Setup (vmbr0, vmbr1)
   - VLAN-Konfiguration
   - Bond-Interfaces (falls Multiple NICs)

4. **Storage-Konfiguration**
   - Local Storage (LVM, ZFS, Dir)
   - Network Storage (NFS, iSCSI, Ceph)
   - Backup-Target definieren

5. **Container/VM-Templates**
   - Download gängiger Templates
   - Erstelle Custom Templates
   - Import ISO-Images

6. **Monitoring-Setup**
   - Prometheus Installation
   - Grafana Deployment
   - AlertManager Konfiguration

7. **Automation**
   - Cron-Jobs für Backups
   - Update-Zeitpläne
   - Log-Rotation

**Interaktive Prompts**:
```bash
# Beispiel: Netzwerk-Setup
read -p "VLAN-Support aktivieren? (y/n): " enable_vlans

if [[ "$enable_vlans" == "y" ]]; then
    read -p "Management VLAN-ID: " mgmt_vlan
    read -p "Production VLAN-ID: " prod_vlan
    
    # Konfiguriere VLANs
    cat >> /etc/network/interfaces << EOF
auto vmbr0.$mgmt_vlan
iface vmbr0.$mgmt_vlan inet static
    address 192.168.${mgmt_vlan}.1/24
