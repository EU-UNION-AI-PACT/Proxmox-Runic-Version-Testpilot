#!/usr/bin/env bash

# ═══════════════════════════════════════════════════════════════════════════
# 🔮 Proxmox Runic Scripts - Interaktives Setup
# ═══════════════════════════════════════════════════════════════════════════
# Autor: EU-UNION-AI-PACT
# Version: 1.0
# Lizenz: MIT
# ═══════════════════════════════════════════════════════════════════════════

set -e

# ═══════════════════════════════════════════════════════════════════════════
# Farben & Styling
# ═══════════════════════════════════════════════════════════════════════════

GN="\033[1;92m"  # Grün
BL="\033[36m"    # Blau
YW="\033[33m"    # Gelb
RD="\033[01;31m" # Rot
PU="\033[35m"    # Lila
CL="\033[m"      # Clear
BD="\033[1m"     # Bold

# ═══════════════════════════════════════════════════════════════════════════
# Helper Funktionen
# ═══════════════════════════════════════════════════════════════════════════

msg_info() {
    echo -e "${BL}[INFO]${CL} $1"
}

msg_ok() {
    echo -e "${GN}[✓]${CL} $1"
}

msg_error() {
    echo -e "${RD}[✗]${CL} $1"
}

msg_warn() {
    echo -e "${YW}[⚠]${CL} $1"
}

msg_title() {
    echo ""
    echo -e "${BD}${PU}╔══════════════════════════════════════════════════════════════════════════════╗${CL}"
    echo -e "${BD}${PU}║${CL} $1"
    echo -e "${BD}${PU}╚══════════════════════════════════════════════════════════════════════════════╝${CL}"
    echo ""
}

separator() {
    echo -e "${BL}────────────────────────────────────────────────────────────────────────────────${CL}"
}

press_any_key() {
    echo ""
    read -p "$(echo -e ${YW}Drücke ENTER um fortzufahren...${CL})" 
    echo ""
}

# ═══════════════════════════════════════════════════════════════════════════
# Banner
# ═══════════════════════════════════════════════════════════════════════════

clear
cat << "BANNER"
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║     ██████╗ ██████╗  ██████╗ ██╗  ██╗███╗   ███╗ ██████╗ ██╗  ██╗          ║
║     ██╔══██╗██╔══██╗██╔═══██╗╚██╗██╔╝████╗ ████║██╔═══██╗╚██╗██╔╝          ║
║     ██████╔╝██████╔╝██║   ██║ ╚███╔╝ ██╔████╔██║██║   ██║ ╚███╔╝           ║
║     ██╔═══╝ ██╔══██╗██║   ██║ ██╔██╗ ██║╚██╔╝██║██║   ██║ ██╔██╗           ║
║     ██║     ██║  ██║╚██████╔╝██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗          ║
║     ╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝          ║
║                                                                              ║
║                    🔮 RUNIC SCRIPTS COLLECTION 🔮                           ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝

                ᚠᚱᛁᛖᛞᛖ • ᚠᚱᛖᛁᚺᛖᛁᛏ • ᛚᛁᛖᛒᛖ • ᚺᚨᚱᛗᛟᚾᛁᛖ
              Friede • Freiheit • Liebe • Harmonie • Vergebung • Loyalität

BANNER

echo ""
msg_info "Willkommen zum interaktiven Setup für Proxmox Runic Scripts!"
echo ""
separator
press_any_key

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 1: Environment Check
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 1/6: System-Prüfung"

msg_info "Prüfe erforderliche Tools..."
echo ""

# Git Check
if command -v git &> /dev/null; then
    GIT_VERSION=$(git --version | awk '{print $3}')
    msg_ok "Git gefunden (Version: $GIT_VERSION)"
else
    msg_error "Git ist nicht installiert!"
    echo ""
    echo "Installation:"
    echo "  Debian/Ubuntu: ${YW}sudo apt install git${CL}"
    echo "  Arch/Manjaro:  ${YW}sudo pacman -S git${CL}"
    echo "  Fedora:        ${YW}sudo dnf install git${CL}"
    exit 1
fi

# Bash Check
if [ -n "$BASH_VERSION" ]; then
    msg_ok "Bash gefunden (Version: $BASH_VERSION)"
else
    msg_error "Bash wird benötigt!"
    exit 1
fi

# curl Check
if command -v curl &> /dev/null; then
    msg_ok "curl gefunden"
else
    msg_warn "curl nicht gefunden (optional)"
fi

echo ""
msg_ok "Alle erforderlichen Tools sind vorhanden!"
sleep 1

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 2: Projekt-Übersicht
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 2/6: Projekt-Übersicht"

echo "Dieses Projekt enthält:"
echo ""
echo "  ${GN}📦 200+ Proxmox Installation Scripts${CL}"
echo "     → Community Scripts für LXC Container & VMs"
echo ""
echo "  ${GN}🔮 Runic Viewer${CL}"
echo "     → Interaktive Web-Oberfläche mit Futhark-Runen"
echo "     → Automatische Text-zu-Runen Konvertierung"
echo "     → Google Fonts: Noto Sans Runic"
echo ""
echo "  ${GN}🚀 Quick Installer Scripts${CL}"
echo "     → 12-install-databases.sh (12 Datenbank-Systeme)"
echo "     → 13-install-media-stack.sh (Arr Stack: Sonarr, Radarr, etc.)"
echo "     → 14-install-security-stack.sh (Vaultwarden, Authelia, etc.)"
echo "     → 15-install-homelab-essentials.sh (Complete Homelab Stacks)"
echo ""
echo "  ${GN}📚 Dokumentation${CL}"
echo "     → MASTER-GUIDE.md (Kompletter Setup-Guide)"
echo "     → CHEAT-SHEET.txt (Schnellreferenz)"
echo "     → 11-community-scripts-overview.md (200+ Scripts Katalog)"
echo ""
echo "  ${GN}🕊️ Friedensmission${CL}"
echo "     → Förderung von Frieden, Freiheit, Harmonie"
echo "     → Philosophische Texte über inneren Frieden"
echo ""
separator
sleep 1

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 3: Verzeichnis-Struktur
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 3/6: Verzeichnis-Struktur"

msg_info "Aktuelle Projekt-Struktur:"
echo ""

if command -v tree &> /dev/null; then
    tree -L 1 -a --dirsfirst /tmp/proxmox-scripts | head -30
else
    ls -lah /tmp/proxmox-scripts | awk '{print $9}' | grep -v "^$" | head -20
fi

echo ""
msg_info "Gesamtanzahl Dateien: $(find /tmp/proxmox-scripts -type f | wc -l)"
msg_info "Gesamtgröße: $(du -sh /tmp/proxmox-scripts | awk '{print $1}')"

sleep 1

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 4: Environment-Konfiguration
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 4/6: Environment-Konfiguration"

if [ -f /tmp/proxmox-scripts/.env ]; then
    msg_ok ".env Datei gefunden - Lade Konfiguration..."
    source /tmp/proxmox-scripts/.env
    echo ""
    separator
    echo -e "${BD}GitHub Konfiguration:${CL}"
    echo "  User:       ${GN}$GITHUB_USER${CL}"
    echo "  Repository: ${GN}$GITHUB_REPO${CL}"
    echo "  Email:      ${GN}$GITHUB_EMAIL${CL}"
    echo "  Branch:     ${GN}$GIT_BRANCH${CL}"
    echo ""
    echo -e "${BD}URLs:${CL}"
    echo "  Repository: ${BL}$REPO_URL${CL}"
    echo "  Pages:      ${BL}$PAGES_URL${CL}"
    echo "  Viewer:     ${BL}$RUNIC_VIEWER_URL${CL}"
    separator
    msg_ok "Konfiguration geladen!"
else
    msg_error ".env Datei nicht gefunden - Bitte zuerst deploy-to-github.sh ausführen!"
    exit 1
fi

sleep 1

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 5: Git Status
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 5/6: Git Repository Status"

cd /tmp/proxmox-scripts

if [ -d .git ]; then
    msg_ok "Git Repository initialisiert"
    echo ""
    
    # Branch Info
    CURRENT_BRANCH=$(git branch --show-current)
    echo -e "${BD}Current Branch:${CL} ${GN}$CURRENT_BRANCH${CL}"
    
    # Remote Info
    if git remote -v | grep -q origin; then
        REMOTE_URL=$(git remote get-url origin)
        echo -e "${BD}Remote Origin:${CL} ${BL}$REMOTE_URL${CL}"
    else
        msg_warn "Kein Remote 'origin' konfiguriert"
    fi
    
    echo ""
    separator
    
    # Letzter Commit
    if git log -1 &> /dev/null; then
        echo -e "${BD}Letzter Commit:${CL}"
        git log -1 --pretty=format:"  Hash:    %C(yellow)%h%Creset%n  Autor:   %an%n  Datum:   %ad%n  Message: %s" --date=format:"%d.%m.%Y %H:%M"
        echo ""
        echo ""
    fi
    
    separator
    
    # Änderungen
    if ! git diff --quiet || ! git diff --cached --quiet; then
        msg_info "Uncommittete Änderungen gefunden:"
        echo ""
        git status --short
        echo ""
        msg_info "Verwende Option [6] im Menü zum Pushen"
    else
        msg_ok "Keine uncommitteten Änderungen - Alles synchronisiert!"
    fi
    
else
    msg_error "Kein Git Repository - Bitte zuerst deploy-to-github.sh ausführen!"
fi

sleep 1

# ═══════════════════════════════════════════════════════════════════════════
# SCHRITT 6: Aktionen
# ═══════════════════════════════════════════════════════════════════════════

msg_title "SCHRITT 6/6: Verfügbare Aktionen"

while true; do
    echo ""
    echo "Was möchtest du tun?"
    echo ""
    echo "  ${YW}[1]${CL} 🔮 Runic Viewer im Browser öffnen"
    echo "  ${YW}[2]${CL} 📚 MASTER-GUIDE.md anzeigen"
    echo "  ${YW}[3]${CL} 🚀 Installer Scripts übersicht"
    echo "  ${YW}[4]${CL} 🌐 GitHub Repository öffnen"
    echo "  ${YW}[5]${CL} 🔄 Git Status anzeigen"
    echo "  ${YW}[6]${CL} 📦 Zu GitHub pushen"
    echo "  ${YW}[7]${CL} 🔧 Environment neu konfigurieren"
    echo "  ${YW}[8]${CL} 📋 Projekt-Statistiken"
    echo "  ${YW}[0]${CL} ❌ Beenden"
    echo ""
    read -p "Deine Wahl: " ACTION
    
    case $ACTION in
        1)
            msg_info "Öffne Runic Viewer..."
            if command -v xdg-open &> /dev/null; then
                xdg-open /tmp/proxmox-scripts/runic-viewer.html 2>/dev/null &
                msg_ok "Runic Viewer geöffnet!"
            elif command -v firefox &> /dev/null; then
                firefox /tmp/proxmox-scripts/runic-viewer.html 2>/dev/null &
                msg_ok "Runic Viewer in Firefox geöffnet!"
            else
                msg_warn "Kein Browser gefunden. Öffne manuell:"
                echo "  file:///tmp/proxmox-scripts/runic-viewer.html"
            fi
            ;;
        2)
            msg_info "MASTER-GUIDE.md:"
            separator
            cat /tmp/proxmox-scripts/MASTER-GUIDE.md
            separator
            ;;
        3)
            msg_info "Verfügbare Installer Scripts:"
            echo ""
            echo "  ${GN}12-install-databases.sh${CL}"
            echo "     PostgreSQL, MariaDB, MongoDB, Redis, InfluxDB, Neo4j,"
            echo "     CouchDB, SQL Server, PocketBase, Meilisearch, MinIO, Garage"
            echo ""
            echo "  ${GN}13-install-media-stack.sh${CL}"
            echo "     Radarr, Sonarr, Prowlarr, Lidarr, Readarr, Bazarr,"
            echo "     Jellyfin, Plex, Overseerr, Tautulli, etc."
            echo ""
            echo "  ${GN}14-install-security-stack.sh${CL}"
            echo "     Vaultwarden, Authelia, 2FAuth, LLDAP, CrowdSec,"
            echo "     Pi-hole, AdGuard Home, etc."
            echo ""
            echo "  ${GN}15-install-homelab-essentials.sh${CL}"
            echo "     Complete Homelab, Container Platform, Network Stack,"
            echo "     Monitoring Stack, Storage Stack, Home Automation, etc."
            ;;
        4)
            if [ -f .env ]; then
                source .env
                msg_info "Öffne GitHub Repository..."
                if command -v xdg-open &> /dev/null; then
                    xdg-open "$REPO_URL" 2>/dev/null &
                    msg_ok "Repository geöffnet!"
                else
                    echo "$REPO_URL"
                fi
            else
                msg_error ".env nicht gefunden!"
            fi
            ;;
        5)
            msg_info "Git Status:"
            separator
            git status
            separator
            ;;
        6)
            msg_info "Pushe zu GitHub..."
            if [ -f .env ]; then
                source .env
                CURRENT_BRANCH=$(git branch --show-current)
                git push origin $CURRENT_BRANCH
                msg_ok "Erfolgreich gepusht!"
            else
                msg_error ".env nicht gefunden!"
            fi
            ;;
        7)
            msg_info "Starte Rekonfiguration..."
            bash /tmp/proxmox-scripts/deploy-to-github.sh
            ;;
        8)
            msg_info "Projekt-Statistiken:"
            separator
            echo "Dateien:           $(find /tmp/proxmox-scripts -type f | wc -l)"
            echo "Verzeichnisse:     $(find /tmp/proxmox-scripts -type d | wc -l)"
            echo "Bash Scripts:      $(find /tmp/proxmox-scripts -name "*.sh" | wc -l)"
            echo "Markdown Dateien:  $(find /tmp/proxmox-scripts -name "*.md" | wc -l)"
            echo "HTML Dateien:      $(find /tmp/proxmox-scripts -name "*.html" | wc -l)"
            echo "Gesamtgröße:       $(du -sh /tmp/proxmox-scripts | awk '{print $1}')"
            echo ""
            if [ -d .git ]; then
                echo "Git Commits:       $(git rev-list --count HEAD)"
                echo "Git Branch:        $(git branch --show-current)"
            fi
            separator
            ;;
        0)
            echo ""
            msg_title "🕊️ Friede • Freiheit • Liebe • Harmonie 🕊️"
            echo ""
            msg_ok "Vielen Dank für die Nutzung von Proxmox Runic Scripts!"
            echo ""
            echo "  Repository: ${BL}https://github.com/EU-UNION-AI-PACT/Proxmox-Runic-Version-Testpilot${CL}"
            echo "  Viewer:     ${BL}https://eu-union-ai-pact.github.io/Proxmox-Runic-Version-Testpilot/runic-viewer.html${CL}"
            echo ""
            echo "                    ᚠᚱᛁᛖᛞᛖ • ᚠᚱᛖᛁᚺᛖᛁᛏ • ᛚᛁᛖᛒᛖ"
            echo ""
            exit 0
            ;;
        *)
            msg_error "Ungültige Auswahl!"
            ;;
    esac
done
