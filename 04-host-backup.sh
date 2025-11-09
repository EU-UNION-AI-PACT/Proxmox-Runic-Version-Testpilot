#!/bin/bash

################################################################################
# Proxmox VE Host Configuration Backup Script
################################################################################
#
# Beschreibung:
#   Erstellt ein Backup der Proxmox Host-Konfiguration
#
# Was wird gesichert:
#   ✅ /etc/pve/ - Komplette Proxmox-Konfiguration
#   ✅ VM- und Container-Konfigurationen
#   ✅ Netzwerk-Einstellungen
#   ✅ Storage-Konfiguration
#   ✅ Benutzer und Berechtigungen
#
# Verwendung:
#   1. Script ausführen:
#
#      bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/host-backup.sh)"
#
#   2. Oder diese Datei verwenden:
#
#      chmod +x 04-host-backup.sh
#      ./04-host-backup.sh
#
# Backup-Ziel auswählen:
#   - Lokales Verzeichnis: /root/backups
#   - NFS-Share (empfohlen)
#   - SMB-Share
#   - USB-Stick
#
# Automatisches Backup (Cron):
#   Füge in /etc/crontab hinzu für tägliches Backup um 2 Uhr:
#
#   0 2 * * * root bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/host-backup.sh)"
#
# Empfehlung:
#   - Backup auf EXTERNEN Speicher!
#   - Regelmäßige Backups (täglich/wöchentlich)
#   - Vor größeren Änderungen manuell ausführen
#
# Wiederherstellung:
#   tar -xzf proxmox-backup-DATUM.tar.gz -C /
#   systemctl restart pve*
#
# Mehr Infos:
#   https://community-scripts.github.io/ProxmoxVE/scripts?id=host-backup
#
################################################################################

echo "💾 Proxmox Host Backup wird erstellt..."
echo ""
echo "⚠️  WICHTIG: Wähle ein EXTERNES Backup-Ziel!"
echo ""

bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/host-backup.sh)"

################################################################################
# MANUELLES BACKUP (Alternative)
################################################################################
#
# Schnelles manuelles Backup:
#
# 1. Backup erstellen:
#    tar -czf /root/proxmox-backup-$(date +%Y%m%d).tar.gz /etc/pve
#
# 2. Auf NFS/SMB kopieren:
#    cp /root/proxmox-backup-*.tar.gz /mnt/backup/
#
# 3. Alte Backups aufräumen (älter als 30 Tage):
#    find /mnt/backup/ -name "proxmox-backup-*.tar.gz" -mtime +30 -delete
#
################################################################################

################################################################################
# ERWEITERTE BACKUP-STRATEGIE
################################################################################
#
# Für Production-Umgebungen:
#
# 1. Proxmox Backup Server installieren:
#    - Dedizierter Backup-Server
#    - Inkrementelle Backups
#    - Verschlüsselung
#    - Deduplication
#
# 2. Kommerzielle Lösungen:
#    - Veeam Backup & Replication
#    - NAKIVO Backup
#    - BDRSuite
#
################################################################################
