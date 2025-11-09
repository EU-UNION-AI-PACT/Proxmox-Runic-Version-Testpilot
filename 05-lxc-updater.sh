#!/bin/bash

################################################################################
# Proxmox LXC Container Updater
################################################################################
#
# Beschreibung:
#   Aktualisiert alle oder ausgewählte LXC Container automatisch
#
# Features:
#   ✅ Update aller laufenden Container
#   ✅ Unterstützt Debian, Ubuntu, Alpine, Fedora, etc.
#   ✅ Automatische Paket-Manager Erkennung
#   ✅ Parallele Updates möglich
#
# Verwendung:
#   1. Alle Container updaten:
#
#      bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/update-lxcs.sh)"
#
#   2. Oder diese Datei verwenden:
#
#      chmod +x 05-lxc-updater.sh
#      ./05-lxc-updater.sh
#
# Automatisches Update (Cron):
#   Wöchentlich sonntags um 3 Uhr:
#
#   0 3 * * 0 root bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/update-lxcs.sh)"
#
# Manuelles Update einzelner Container:
#   pct exec 100 -- bash -c "apt update && apt upgrade -y"
#
# Mehr Infos:
#   https://community-scripts.github.io/ProxmoxVE/scripts?id=update-lxcs
#
################################################################################

echo "🔄 LXC Container Updater"
echo ""
echo "📦 Verfügbare Container:"
pct list
echo ""

bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/update-lxcs.sh)"

################################################################################
# MANUELLE CONTAINER-UPDATES
################################################################################
#
# Debian/Ubuntu Container:
#   pct exec <CTID> -- bash -c "apt update && apt upgrade -y && apt autoremove -y"
#
# Alpine Linux Container:
#   pct exec <CTID> -- sh -c "apk update && apk upgrade"
#
# Fedora/CentOS/Rocky Container:
#   pct exec <CTID> -- bash -c "dnf update -y && dnf autoremove -y"
#
# Arch Linux Container:
#   pct exec <CTID> -- bash -c "pacman -Syu --noconfirm"
#
################################################################################

################################################################################
# ERWEITERTE OPTIONEN
################################################################################
#
# 1. Nur laufende Container updaten:
#    for ct in $(pct list | grep running | awk '{print $1}'); do
#      pct exec $ct -- bash -c "apt update && apt upgrade -y"
#    done
#
# 2. Update-Log erstellen:
#    bash update-lxcs.sh 2>&1 | tee /var/log/lxc-updates.log
#
# 3. Container vorher/nachher starten/stoppen:
#    pct start <CTID>
#    sleep 30
#    pct exec <CTID> -- apt update && apt upgrade -y
#    pct stop <CTID>
#
################################################################################
