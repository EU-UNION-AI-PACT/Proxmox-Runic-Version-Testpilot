#!/bin/bash

################################################################################
# ProxMenux Installer
################################################################################
#
# Beschreibung:
#   Installiert ProxMenux - ein menügesteuertes Tool für Proxmox VE Management
#
# Features:
#   - Text-basiertes Menü-Interface
#   - VM/LXC Container Management
#   - Netzwerk- und Storage-Konfiguration
#   - Hardware-Management (GPU, Coral-TPU)
#   - Post-Install Scripts Integration
#   - ProxMenux Monitor (Web-Dashboard auf Port 8008)
#
# Verwendung:
#   1. Kopiere diesen Befehl in die Proxmox Shell:
#
#      bash -c "$(wget -qLO - https://raw.githubusercontent.com/MacRimi/ProxMenux/main/install_proxmenux.sh)"
#
#   2. Oder führe diese Datei direkt aus:
#
#      chmod +x 01-proxmenux-install.sh
#      ./01-proxmenux-install.sh
#
# Nach der Installation:
#   - Starte ProxMenux mit dem Befehl: menu
#   - Web-Dashboard: http://<PROXMOX-IP>:8008
#
# Deinstallation:
#   - Im ProxMenux-Menü unter Settings -> Uninstall ProxMenux
#
# Mehr Infos:
#   - GitHub: https://github.com/MacRimi/ProxMenux
#   - Doku: https://macrimi.github.io/ProxMenux/docs/introduction
#
################################################################################

# Direkter Download und Ausführung
bash -c "$(wget -qLO - https://raw.githubusercontent.com/MacRimi/ProxMenux/main/install_proxmenux.sh)"

################################################################################
# MANUAL INSTALLATION (Alternative)
################################################################################
#
# Falls der direkte Download nicht funktioniert, hier die manuellen Schritte:
#
# 1. Dependencies installieren:
#    apt update
#    apt install -y whiptail curl jq python3 python3-venv python3-pip
#
# 2. Download ProxMenux:
#    mkdir -p /usr/local/share/proxmenux
#    wget -O /usr/local/bin/menu https://raw.githubusercontent.com/MacRimi/ProxMenux/main/menu
#    wget -O /usr/local/share/proxmenux/utils.sh https://raw.githubusercontent.com/MacRimi/ProxMenux/main/scripts/utils.sh
#    chmod +x /usr/local/bin/menu
#
# 3. ProxMenux starten:
#    menu
#
################################################################################
