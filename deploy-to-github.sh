#!/usr/bin/env bash

# ═══════════════════════════════════════════════════════════════════════════
# GitHub Deployment Script - Proxmox Runic Scripts
# ═══════════════════════════════════════════════════════════════════════════

set -e

echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║           GitHub Repository Setup - Proxmox Runic Scripts                   ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
echo ""

# Farben
GN="\033[1;92m"
BL="\033[36m"
YW="\033[33m"
RD="\033[01;31m"
CL="\033[m"

msg_info() {
    echo -e "${BL}[INFO]${CL} $1"
}

msg_ok() {
    echo -e "${GN}[OK]${CL} $1"
}

msg_error() {
    echo -e "${RD}[ERROR]${CL} $1"
}

# Prüfe ob Git installiert ist
if ! command -v git &> /dev/null; then
    msg_error "Git ist nicht installiert!"
    echo "Installiere Git mit: sudo pacman -S git"
    exit 1
fi

msg_ok "Git gefunden"
echo ""

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 1: GitHub Informationen
# ═══════════════════════════════════════════════════════════════════════════

echo "📋 Schritt 1: GitHub Konfiguration"
echo "─────────────────────────────────────────────────────────────────────────────"

read -p "🔹 Dein GitHub Username: " GITHUB_USER
read -p "🔹 Repository Name [proxmox-runic-scripts]: " REPO_NAME
REPO_NAME=${REPO_NAME:-proxmox-runic-scripts}

echo ""
msg_info "Repository wird sein: https://github.com/$GITHUB_USER/$REPO_NAME"
echo ""

read -p "Ist das korrekt? (y/n): " CONFIRM
if [ "$CONFIRM" != "y" ]; then
    msg_error "Abgebrochen."
    exit 0
fi

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 2: Git initialisieren
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "🔧 Schritt 2: Git Repository initialisieren"
echo "─────────────────────────────────────────────────────────────────────────────"

cd /tmp/proxmox-scripts

if [ -d .git ]; then
    msg_info "Git Repository existiert bereits."
    read -p "Neu initialisieren? (y/n): " REINIT
    if [ "$REINIT" = "y" ]; then
        rm -rf .git
        git init
        msg_ok "Repository neu initialisiert"
    fi
else
    git init
    msg_ok "Git Repository initialisiert"
fi

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 3: Git Config
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "🔧 Schritt 3: Git Konfiguration"
echo "─────────────────────────────────────────────────────────────────────────────"

read -p "🔹 Deine Email für Git commits: " GIT_EMAIL

git config user.name "$GITHUB_USER"
git config user.email "$GIT_EMAIL"
msg_ok "Git konfiguriert"

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 4: README aktualisieren
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "🔧 Schritt 4: README mit deinem Username aktualisieren"
echo "─────────────────────────────────────────────────────────────────────────────"

# Erstelle ein schönes README falls nicht vorhanden
if [ ! -f README.md ]; then
    cat > README.md << 'EOFREADME'
# 🔮 Proxmox Runic Scripts Collection

> **200+ One-Click Installation Scripts für Proxmox VE mit Futhark Runen-Darstellung**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Proxmox](https://img.shields.io/badge/Proxmox-VE%207%2F8-orange)](https://www.proxmox.com/)

## ✨ Features

- 🔮 **Runic Viewer** - Interaktive Darstellung mit echten Futhark-Runen
- 🐳 **200+ Scripts** - Container, VMs, Databases, Security, Media
- 🎯 **Quick Installers** - 4 interaktive Setup-Scripts
- 🌍 **Friedensmission** - Förderung von Frieden, Freiheit, Harmonie

## 🚀 Quick Start

### Runic Viewer (Browser)

```bash
# Repository klonen
git clone https://github.com/DEIN-USERNAME/DEIN-REPO.git
cd DEIN-REPO

# Im Browser öffnen
firefox runic-viewer.html
```

### Proxmox Installation

```bash
# Auf Proxmox Host:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/DEIN-USERNAME/DEIN-REPO/main/install.sh)"
```

## 📚 Verfügbare Scripts

- `12-install-databases.sh` - 12 Datenbank-Systeme
- `13-install-media-stack.sh` - Media Server (Arr Stack)
- `14-install-security-stack.sh` - Security & Auth
- `15-install-homelab-essentials.sh` - Complete Homelab

## 🕊️ Mission

```
ᚠᚱᛁᛖᛞᛖ • ᚠᚱᛖᛁᚺᛖᛁᛏ • ᛚᛁᛖᛒᛖ • ᚺᚨᚱᛗᛟᚾᛁᛖ • ᚡᛖᚱᚷᛖᛒᚢᚾᚷ • ᛚᛟᛃᚨᛚᛁᛏᚨᛏ
Friede • Freiheit • Liebe • Harmonie • Vergebung • Loyalität
```

**"Wahrer Frieden beginnt im Herzen jedes Einzelnen."**

## 📖 Dokumentation

- [Master Guide](MASTER-GUIDE.md) - Kompletter Setup-Guide
- [Cheat Sheet](CHEAT-SHEET.txt) - Schnellreferenz
- [Script Overview](11-community-scripts-overview.md) - Alle 200+ Scripts

## 🤝 Contributing

Contributions sind willkommen! Siehe [CONTRIBUTING.md](CONTRIBUTING.md)

## 📜 Lizenz

MIT License - Siehe [LICENSE](LICENSE)

---

**Made with ❤️ for Peace, Freedom and Harmony**
EOFREADME
    msg_ok "README.md erstellt"
fi

# Aktualisiere Platzhalter
if [ -f README.md ]; then
    sed -i "s/DEIN-USERNAME/$GITHUB_USER/g" README.md
    sed -i "s/DEIN-REPO/$REPO_NAME/g" README.md
    msg_ok "README.md aktualisiert"
fi

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 5: .gitignore erstellen
# ═══════════════════════════════════════════════════════════════════════════

if [ ! -f .gitignore ]; then
    cat > .gitignore << 'EOFGITIGNORE'
# Logs
*.log
logs/

# Temporary files
*.tmp
*.swp
*~
.DS_Store

# Backup files
*.bak
*.backup

# Editor files
.vscode/
.idea/
*.sublime-*

# User-specific
config.local
secrets.yml
*.secret
EOFGITIGNORE
    msg_ok ".gitignore erstellt"
fi

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 6: LICENSE erstellen
# ═══════════════════════════════════════════════════════════════════════════

if [ ! -f LICENSE ]; then
    cat > LICENSE << EOFLICENSE
MIT License

Copyright (c) $(date +%Y) $GITHUB_USER

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOFLICENSE
    msg_ok "LICENSE erstellt"
fi

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 7: Git Add & Commit
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "🔧 Schritt 5: Dateien zu Git hinzufügen"
echo "─────────────────────────────────────────────────────────────────────────────"

git add .
msg_ok "Alle Dateien hinzugefügt"

echo ""
git commit -m "Initial commit: Proxmox Runic Scripts with Peace Mission

ᚠᚱᛁᛖᛞᛖ • ᚠᚱᛖᛁᚺᛖᛁᛏ • ᛚᛁᛖᛒᛖ • ᚺᚨᚱᛗᛟᚾᛁᛖ • ᚡᛖᚱᚷᛖᛒᚢᚾᚷ • ᛚᛟᛃᚨᛚᛁᛏᚨᛏ

- 200+ Proxmox installation scripts
- Interactive Runic Viewer with Futhark runes
- 4 quick installer scripts
- Peace mission: Promoting peace, freedom, love, harmony, forgiveness, loyalty"

msg_ok "Initial commit erstellt"

# ═══════════════════════════════════════════════════════════════════════════
# Schritt 8: Remote & Branch
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "🔧 Schritt 6: GitHub Remote konfigurieren"
echo "─────────────────────────────────────────────────────────────────────────────"

REMOTE_URL="https://github.com/$GITHUB_USER/$REPO_NAME.git"

if git remote | grep -q origin; then
    git remote remove origin
fi

git remote add origin "$REMOTE_URL"
git branch -M main
msg_ok "Remote 'origin' konfiguriert"

# ═══════════════════════════════════════════════════════════════════════════
# Fertig!
# ═══════════════════════════════════════════════════════════════════════════

echo ""
echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║                          ✅ VORBEREITUNG KOMPLETT! ✅                       ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
echo ""
echo "📋 Repository Information:"
echo "   • GitHub User: $GITHUB_USER"
echo "   • Repository:  $REPO_NAME"
echo "   • URL:         $REMOTE_URL"
echo ""
echo "🎯 Nächste Schritte:"
echo ""
echo "1️⃣  Erstelle das Repository auf GitHub:"
echo "    🌐 Gehe zu: https://github.com/new"
echo "    📝 Repository Name: $REPO_NAME"
echo "    ✅ Public (oder Private - deine Wahl)"
echo "    ❌ KEIN README/License/gitignore hinzufügen (haben wir schon!)"
echo ""
echo "2️⃣  GitHub Push - Wähle eine Methode:"
echo ""
echo "    ${YW}[1]${CL} Mit Personal Access Token (empfohlen)"
echo "    ${YW}[2]${CL} Mit SSH Key"
echo "    ${YW}[3]${CL} Manuell später"
echo ""
read -p "Deine Wahl (1-3): " PUSH_METHOD
echo ""

case $PUSH_METHOD in
    1)
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "🔑 GitHub Personal Access Token benötigt"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Token erstellen: ${BL}https://github.com/settings/tokens/new${CL}"
        echo "Erforderliche Permissions: ${YW}repo${CL} (Full control of private repositories)"
        echo ""
        read -sp "🔹 GitHub Token eingeben (bleibt unsichtbar): " GITHUB_TOKEN
        echo ""
        echo ""
        
        if [ -z "$GITHUB_TOKEN" ]; then
            msg_error "Kein Token eingegeben!"
            echo "Push manuell später mit:"
            echo "${YW}git push https://TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git main${CL}"
        else
            msg_info "Pushe Repository zu GitHub..."
            if git push https://$GITHUB_TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git main; then
                msg_ok "Repository erfolgreich gepusht!"
                echo ""
                echo "🌐 Repository URL: ${GN}https://github.com/$GITHUB_USER/$REPO_NAME${CL}"
            else
                msg_error "Push fehlgeschlagen!"
                echo "Prüfe:"
                echo "  1. Token Permissions (repo)"
                echo "  2. Repository existiert auf GitHub"
                echo "  3. Repository Name ist korrekt"
            fi
        fi
        ;;
    2)
        msg_info "SSH Push wird vorbereitet..."
        git remote set-url origin "git@github.com:$GITHUB_USER/$REPO_NAME.git"
        echo ""
        echo "SSH Remote konfiguriert. Pushe jetzt mit:"
        echo "${YW}git push -u origin main${CL}"
        echo ""
        read -p "Jetzt pushen? (y/n): " DO_PUSH
        if [ "$DO_PUSH" = "y" ]; then
            git push -u origin main
        fi
        ;;
    3)
        msg_info "Push später manuell mit:"
        echo ""
        echo "Mit Token:"
        echo "${YW}git push https://TOKEN@github.com/$GITHUB_USER/$REPO_NAME.git main${CL}"
        echo ""
        echo "Mit SSH:"
        echo "${YW}git remote set-url origin git@github.com:$GITHUB_USER/$REPO_NAME.git${CL}"
        echo "${YW}git push -u origin main${CL}"
        ;;
esac
echo ""
echo "3️⃣  Runic Viewer URL:"
echo "    ${GN}https://$GITHUB_USER.github.io/$REPO_NAME/runic-viewer.html${CL}"
echo "    (Aktiviere GitHub Pages in Repository Settings)"
echo ""
echo "╔══════════════════════════════════════════════════════════════════════════════╗"
echo "║                    🕊️ Friede • Freiheit • Harmonie 🕊️                     ║"
echo "╚══════════════════════════════════════════════════════════════════════════════╝"
echo ""
