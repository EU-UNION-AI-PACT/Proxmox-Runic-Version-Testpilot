#!/bin/bash

################################################################################
# Proxmox Monitoring Setup Guide
################################################################################
#
# Beschreibung:
#   Anleitungen zur Einrichtung von Monitoring-Lösungen für Proxmox VE
#
################################################################################

################################################################################
# OPTION 1: InfluxDB + Grafana (Empfohlen)
################################################################################
#
# Schritt 1: InfluxDB LXC Container erstellen
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/influxdb.sh)"
#
# Schritt 2: Grafana LXC Container erstellen
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/grafana.sh)"
#
# Schritt 3: Proxmox VE Metrik-Export konfigurieren
#
# 1. In Proxmox Web-UI:
#    Datacenter → Metric Server → Add → InfluxDB
#    - Server: <InfluxDB-Container-IP>
#    - Port: 8086
#    - Protocol: HTTP
#    - Organization: proxmox
#    - Bucket: proxmox
#    - Token: <erstelle Token in InfluxDB>
#
# 2. InfluxDB Token erstellen:
#    - InfluxDB UI: http://<InfluxDB-IP>:8086
#    - Load Data → Tokens → Generate Token
#
# 3. Grafana Dashboard importieren:
#    - Grafana UI: http://<Grafana-IP>:3000
#    - Login: admin / admin
#    - Add Data Source → InfluxDB
#    - Import Dashboard ID: 15356 (Proxmox via InfluxDB)
#
################################################################################

################################################################################
# OPTION 2: Netdata (Einfach & Schnell)
################################################################################
#
# Netdata direkt auf Proxmox Host installieren:
#
# bash <(curl -Ss https://my-netdata.io/kickstart.sh)
#
# Zugriff:
#   http://<PROXMOX-IP>:19999
#
# Features:
#   - Real-time Monitoring
#   - Zero-Configuration
#   - Schöne Dashboards
#   - Wenig Ressourcen-Verbrauch
#
################################################################################

################################################################################
# OPTION 3: Prometheus + Grafana
################################################################################
#
# Schritt 1: Prometheus LXC Container
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/prometheus.sh)"
#
# Schritt 2: Proxmox Exporter installieren
#
# # In Prometheus Container:
# pct exec <PROMETHEUS-CTID> -- bash -c "
#   wget https://github.com/prometheus-pve/prometheus-pve-exporter/releases/latest/download/prometheus-pve-exporter
#   chmod +x prometheus-pve-exporter
#   ./prometheus-pve-exporter --config /etc/prometheus-pve-exporter.yml
# "
#
# Schritt 3: Grafana Dashboard importieren (ID: 10347)
#
################################################################################

################################################################################
# OPTION 4: Uptime Kuma (Status-Monitoring)
################################################################################
#
# Einfaches Uptime-Monitoring:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/uptimekuma.sh)"
#
# Features:
#   - HTTP(s) Monitoring
#   - Ping Monitoring
#   - Port Monitoring
#   - Benachrichtigungen (Email, Telegram, etc.)
#   - Public Status Page
#
# Zugriff: http://<CONTAINER-IP>:3001
#
################################################################################

################################################################################
# OPTION 5: CheckMK (Enterprise-grade)
################################################################################
#
# CheckMK Raw Edition installieren:
#
# # Ubuntu/Debian Container erstellen
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/debian.sh)"
#
# # In Container:
# pct exec <CTID> -- bash -c "
#   wget https://download.checkmk.com/checkmk/2.3.0/check-mk-raw-2.3.0_0.jammy_amd64.deb
#   apt install -y ./check-mk-raw-2.3.0_0.jammy_amd64.deb
#   omd create monitoring
#   omd start monitoring
# "
#
# Zugriff: http://<CONTAINER-IP>/monitoring
#
################################################################################

################################################################################
# OPTION 6: Zabbix
################################################################################
#
# Zabbix LXC Container:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/ct/zabbix.sh)"
#
# Proxmox Agent installieren:
#   apt install zabbix-agent2
#
################################################################################

################################################################################
# METRIK-EXPORT AKTIVIEREN (Proxmox Built-in)
################################################################################
#
# Proxmox hat eingebauten Metrik-Export!
#
# 1. Web-UI: Datacenter → Metric Server
#
# 2. Unterstützte Ziele:
#    - InfluxDB (v2)
#    - Graphite
#
# 3. Exportierte Metriken:
#    - CPU Usage
#    - Memory Usage
#    - Disk I/O
#    - Network Traffic
#    - VM/CT Status
#    - Storage Usage
#
################################################################################

################################################################################
# EMPFOHLENES SETUP (Production)
################################################################################
#
# Kleine Umgebung (1-3 Hosts):
#   → Netdata (einfach, schnell)
#   → Uptime Kuma (Status)
#
# Mittlere Umgebung (3-10 Hosts):
#   → InfluxDB + Grafana
#   → Uptime Kuma
#   → Telegram/Email Alerts
#
# Große Umgebung (10+ Hosts):
#   → Prometheus + Grafana
#   → CheckMK oder Zabbix
#   → Zentrales Logging (ELK/Graylog)
#   → PagerDuty/Opsgenie Integration
#
################################################################################

################################################################################
# ALERT-KONFIGURATION
################################################################################
#
# E-Mail Alerts in Proxmox:
#
# 1. Postfix konfigurieren:
#    dpkg-reconfigure postfix
#
# 2. Test-Mail senden:
#    echo "Test" | mail -s "Proxmox Test" user@example.com
#
# 3. Alerts in Web-UI:
#    Datacenter → Notifications
#
################################################################################

################################################################################
# DASHBOARD EMPFEHLUNGEN
################################################################################
#
# Grafana Dashboards für Proxmox:
#
# - 15356: Proxmox via InfluxDB
# - 10347: Proxmox via Prometheus
# - 13891: Proxmox Cluster Monitor
# - 12632: Proxmox Summary
#
# Import: Grafana → Dashboards → Import → Dashboard ID eingeben
#
################################################################################

echo "📊 Monitoring Setup Guide"
echo ""
echo "💡 Wähle eine der Monitoring-Optionen oben aus"
echo ""
echo "🎯 Empfehlung: InfluxDB + Grafana für beste Balance zwischen Features und Komplexität"
