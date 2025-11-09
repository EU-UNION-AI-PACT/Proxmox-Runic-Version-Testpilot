#!/bin/bash

################################################################################
# LXC Container Erstellungs-Beispiele
################################################################################
#
# Beschreibung:
#   Beispiele zur automatischen LXC-Container-Erstellung mit Helper Scripts
#
# Voraussetzungen:
#   - Proxmox VE 7.0 oder höher
#   - Community Helper Scripts (siehe 00-README.md)
#
# Verwendung:
#   1. Gewünschtes Beispiel in Proxmox Shell kopieren
#   2. CTID, Namen und IP-Adressen anpassen
#   3. Ausführen
#
################################################################################

################################################################################
# BEISPIEL 1: Home Assistant Container
################################################################################
#
# Home Assistant als LXC Container:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/homeassistant.sh)"
#
# Eigenschaften:
#   - Speicher: 2048 MB
#   - CPU: 2 Cores
#   - Storage: 16 GB
#   - Privileged Container
#   - Auto-Update: Ja
#
################################################################################

################################################################################
# BEISPIEL 2: Docker Container (Unprivileged)
################################################################################
#
# Docker in unprivileged LXC:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/docker.sh)"
#
# Nach Installation:
#   - Docker & Docker Compose installiert
#   - Zugriff: pct enter <CTID>
#   - Portainer optional: docker run -d -p 9000:9000 portainer/portainer-ce
#
################################################################################

################################################################################
# BEISPIEL 3: Nginx Proxy Manager
################################################################################
#
# Nginx Proxy Manager für Reverse Proxy:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/nginxproxymanager.sh)"
#
# Standard-Login:
#   URL: http://<CONTAINER-IP>:81
#   Email: admin@example.com
#   Password: changeme
#
################################################################################

################################################################################
# BEISPIEL 4: Pi-hole (Ad-Blocker)
################################################################################
#
# Pi-hole als DNS-Server mit Ad-Blocking:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/pihole.sh)"
#
# Nach Installation:
#   - Web-Interface: http://<CONTAINER-IP>/admin
#   - Password: siehe Container-Log oder setzen mit: pihole -a -p
#
################################################################################

################################################################################
# BEISPIEL 5: Nextcloud
################################################################################
#
# Nextcloud Private Cloud:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/nextcloud.sh)"
#
# Zugriff:
#   - URL: http://<CONTAINER-IP>
#   - Setup-Wizard durchführen
#   - Admin-Account erstellen
#
################################################################################

################################################################################
# BEISPIEL 6: Uptime Kuma (Monitoring)
################################################################################
#
# Uptime Kuma für Service-Monitoring:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/uptimekuma.sh)"
#
# Features:
#   - Status-Monitoring
#   - Benachrichtigungen
#   - Public Status Page
#   - Zugriff: http://<CONTAINER-IP>:3001
#
################################################################################

################################################################################
# BEISPIEL 7: MQTT Broker (Mosquitto)
################################################################################
#
# MQTT Broker für IoT/Smart Home:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/mqtt.sh)"
#
# Konfiguration:
#   - Port: 1883 (Standard)
#   - Config: /etc/mosquitto/mosquitto.conf
#   - Logs: /var/log/mosquitto/
#
################################################################################

################################################################################
# BEISPIEL 8: Zigbee2MQTT
################################################################################
#
# Zigbee2MQTT für Smart Home:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/zigbee2mqtt.sh)"
#
# Wichtig:
#   - USB Zigbee-Stick durchreichen!
#   - Config: /opt/zigbee2mqtt/data/configuration.yaml
#   - Web-UI: http://<CONTAINER-IP>:8080
#
################################################################################

################################################################################
# BEISPIEL 9: Plex Media Server
################################################################################
#
# Plex für Media-Streaming:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/plex.sh)"
#
# Setup:
#   - URL: http://<CONTAINER-IP>:32400/web
#   - Plex Account benötigt
#   - Media-Ordner mounten
#
################################################################################

################################################################################
# BEISPIEL 10: MariaDB Datenbank
################################################################################
#
# MariaDB SQL Datenbank:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/mariadb.sh)"
#
# Root-Password:
#   - Wird bei Installation angezeigt
#   - Oder manuell setzen: mysql_secure_installation
#
################################################################################

################################################################################
# ALLE VERFÜGBAREN CONTAINER ANZEIGEN
################################################################################
#
# Besuche die Helper Scripts Webseite:
#   https://community-scripts.github.io/ProxmoxVE/
#
# Oder im Terminal suchen:
#   curl -s https://api.github.com/repos/community-scripts/ProxmoxVE/contents/ct | jq -r '.[].name'
#
################################################################################

################################################################################
# CUSTOM CONTAINER ERSTELLEN (Manuell)
################################################################################
#
# Ubuntu 24.04 LXC erstellen:
#
# pct create 100 local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst \
#   --hostname ubuntu-test \
#   --password MeinPasswort123 \
#   --cores 2 \
#   --memory 2048 \
#   --rootfs local-lvm:8 \
#   --net0 name=eth0,bridge=vmbr0,ip=dhcp \
#   --unprivileged 1 \
#   --start 1
#
# Container starten:
#   pct start 100
#
# In Container einloggen:
#   pct enter 100
#
################################################################################

echo "💡 Dieser Script enthält BEISPIELE für LXC-Container-Erstellung"
echo ""
echo "📖 Öffne diese Datei in einem Editor und kopiere die gewünschten Befehle"
echo ""
echo "🌐 Alle verfügbaren Scripts: https://community-scripts.github.io/ProxmoxVE/"
