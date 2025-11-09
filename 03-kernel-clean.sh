#!/bin/bash

################################################################################
# Proxmox VE Kernel Cleanup Script
################################################################################
#
# Beschreibung:
#   Entfernt alte, nicht mehr benötigte Kernel-Versionen
#
# Warum wichtig:
#   - Spart Speicherplatz (mehrere GB!)
#   - Beschleunigt Updates
#   - Übersichtlichere Boot-Einträge
#
# Sicherheit:
#   ✅ Löscht NICHT den aktuell laufenden Kernel
#   ✅ Behält die neuesten Kernel als Fallback
#   ✅ Sichere Ausführung
#
# Verwendung:
#   1. Aktuellen Kernel prüfen:
#
#      uname -r
#
#   2. Script ausführen:
#
#      bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/kernel-clean.sh)"
#
#   3. Oder diese Datei verwenden:
#
#      chmod +x 03-kernel-clean.sh
#      ./03-kernel-clean.sh
#
# Empfohlener Zeitpunkt:
#   - Nach größeren Proxmox-Updates
#   - Wenn /boot fast voll ist
#   - Mindestens einmal pro Quartal
#
# Mehr Infos:
#   https://community-scripts.github.io/ProxmoxVE/scripts?id=kernel-clean
#
################################################################################

echo "🔍 Aktuell laufender Kernel:"
uname -r
echo ""
echo "📦 Installierte Kernel:"
dpkg --list | grep pve-kernel
echo ""
echo "🧹 Kernel Cleanup wird gestartet..."
echo ""

bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/kernel-clean.sh)"

################################################################################
# Nach dem Cleanup:
#
# 1. Freigegeben Speicherplatz prüfen:
#    df -h /boot
#
# 2. Verbleibende Kernel anzeigen:
#    dpkg --list | grep pve-kernel
#
# 3. Optional: Grub aktualisieren (automatisch erledigt)
#    update-grub
#
################################################################################
