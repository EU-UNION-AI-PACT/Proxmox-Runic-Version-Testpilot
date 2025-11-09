#!/bin/bash

################################################################################
# Proxmox VE Post-Install Script
################################################################################
#
# Beschreibung:
#   Optimiert eine frische Proxmox VE Installation
#
# Was macht dieses Script:
#   ✅ Entfernt Enterprise Repository (nur mit Subscription)
#   ✅ Aktiviert No-Subscription Repository
#   ✅ Entfernt Subscription Nag-Screen
#   ✅ Deaktiviert High-Availability auf Single-Node (spart Ressourcen)
#   ✅ Führt System-Updates durch
#   ✅ Installiert aktuellen Kernel
#
# Verwendung:
#   1. In Proxmox Shell kopieren:
#
#      bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pve-install.sh)"
#
#   2. Oder diese Datei ausführen:
#
#      chmod +x 02-post-install.sh
#      ./02-post-install.sh
#
# Wichtig:
#   - Nur EINMAL nach frischer Installation ausführen!
#   - Neustart nach Ausführung empfohlen
#   - Nicht für Production mit Enterprise Support verwenden
#
# Alternative für Proxmox Backup Server:
#   bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pbs-install.sh)"
#
# Mehr Infos:
#   https://community-scripts.github.io/ProxmoxVE/scripts?id=post-pve-install
#
################################################################################

echo "🚀 Proxmox VE Post-Install Script wird heruntergeladen und ausgeführt..."
echo ""

bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pve-install.sh)"

################################################################################
# Nach dem Script:
#
# 1. System neustarten (empfohlen):
#    reboot
#
# 2. Proxmox Web-UI neu laden (kein Nag-Screen mehr!)
#
# 3. Updates überprüfen:
#    apt update && apt upgrade -y
#
################################################################################
