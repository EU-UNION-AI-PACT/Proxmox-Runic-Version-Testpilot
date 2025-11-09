#!/usr/bin/env bash

# =============================================================================
# Proxmox Community Scripts - Homelab Essentials
# =============================================================================
# Die wichtigsten Services für ein komplettes Homelab
# =============================================================================

set -e

YW="\033[33m"
BL="\033[36m"
RD="\033[01;31m"
GN="\033[1;92m"
CL="\033[m"

msg_info() {
    echo -e "${BL}[INFO]${CL} ${GN}$1${CL}"
}

header_info() {
    cat <<"EOF"
    __  __                     __          __  
   / / / /___  ____ ___  ___  / /___ _____/ /_ 
  / /_/ / __ \/ __ `__ \/ _ \/ / __ `/ __  /  
 / __  / /_/ / / / / / /  __/ / /_/ / /_/ /   
/_/ /_/\____/_/ /_/ /_/\___/_/\__,_/\__,_/    
                                               
 Essential Homelab Stack
EOF
}

clear
header_info
echo ""

msg_info "Homelab Essential Stacks:"
echo ""
echo "  1) 🏠 Complete Homelab"
echo "     Docker + NPM + Portainer + Pi-hole + Grafana + Uptime Kuma"
echo ""
echo "  2) 🐳 Container Platform"
echo "     Docker + Dockge + Portainer"
echo ""
echo "  3) 🌐 Network Stack"
echo "     Pi-hole + Nginx Proxy Manager + Cloudflared"
echo ""
echo "  4) 📊 Monitoring Stack"
echo "     Grafana + InfluxDB + Uptime Kuma"
echo ""
echo "  5) 📁 Storage & Backup"
echo "     Nextcloud + MinIO + Duplicati"
echo ""
echo "  6) 🤖 Home Automation"
echo "     Home Assistant + ESPHome + Node-RED"
echo ""
echo "  7) 💻 Development Environment"
echo "     Code Server + Gitea + PostgreSQL + Redis"
echo ""
echo "  8) 🎬 Media Server"
echo "     Jellyfin + Radarr + Sonarr + Prowlarr"
echo ""
echo "  0) Abbrechen"
echo ""

read -rp "Deine Auswahl: " choice

install_docker() {
    msg_info "Installiere Docker LXC..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"
}

install_dockge() {
    msg_info "Installiere Dockge..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dockge.sh)"
}

install_npm() {
    msg_info "Installiere Nginx Proxy Manager..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nginxproxymanager.sh)"
}

install_pihole() {
    msg_info "Installiere Pi-hole..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pihole.sh)"
}

install_grafana() {
    msg_info "Installiere Grafana..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/grafana.sh)"
}

install_influxdb() {
    msg_info "Installiere InfluxDB..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/influxdb.sh)"
}

install_nextcloud() {
    msg_info "Installiere Nextcloud VM..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/nextcloud-vm.sh)"
}

install_minio() {
    msg_info "Installiere MinIO..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/minio.sh)"
}

install_cloudflared() {
    msg_info "Installiere Cloudflared..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cloudflared.sh)"
}

install_codeserver() {
    msg_info "Installiere Code Server..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/coder-code-server.sh)"
}

install_gitea() {
    msg_info "Installiere Gitea..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/gitea.sh)"
}

install_postgresql() {
    msg_info "Installiere PostgreSQL..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/postgresql.sh)"
}

install_redis() {
    msg_info "Installiere Redis..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/redis.sh)"
}

install_esphome() {
    msg_info "Installiere ESPHome..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/esphome.sh)"
}

install_radarr() {
    msg_info "Installiere Radarr..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/radarr.sh)"
}

install_prowlarr() {
    msg_info "Installiere Prowlarr..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/prowlarr.sh)"
}

case $choice in
    1)
        msg_info "🏠 Installiere Complete Homelab Stack..."
        install_docker
        install_npm
        install_pihole
        install_grafana
        install_influxdb
        ;;
    2)
        msg_info "🐳 Installiere Container Platform..."
        install_docker
        install_dockge
        ;;
    3)
        msg_info "🌐 Installiere Network Stack..."
        install_pihole
        install_npm
        install_cloudflared
        ;;
    4)
        msg_info "📊 Installiere Monitoring Stack..."
        install_grafana
        install_influxdb
        ;;
    5)
        msg_info "📁 Installiere Storage & Backup..."
        install_nextcloud
        install_minio
        ;;
    6)
        msg_info "🤖 Installiere Home Automation..."
        # Home Assistant (separate script needed)
        install_esphome
        ;;
    7)
        msg_info "💻 Installiere Development Environment..."
        install_codeserver
        install_gitea
        install_postgresql
        install_redis
        ;;
    8)
        msg_info "🎬 Installiere Media Server..."
        # Jellyfin (separate script needed)
        install_radarr
        install_prowlarr
        ;;
    0)
        msg_info "Abgebrochen."
        exit 0
        ;;
    *)
        msg_info "Ungültige Auswahl!"
        exit 1
        ;;
esac

echo ""
msg_info "✅ Homelab Stack Installation abgeschlossen!"
echo ""
msg_info "🎯 Empfohlene nächste Schritte:"
msg_info ""
msg_info "1. Netzwerk konfigurieren:"
msg_info "   • DNS: Pi-hole als DNS Server einrichten"
msg_info "   • Proxy: NPM für HTTPS/SSL konfigurieren"
msg_info "   • Tunnel: Cloudflared für externe Zugriffe"
msg_info ""
msg_info "2. Monitoring aufsetzen:"
msg_info "   • Grafana Dashboards importieren"
msg_info "   • InfluxDB Datenquellen verbinden"
msg_info "   • Proxmox Metriken sammeln"
msg_info ""
msg_info "3. Backup-Strategie:"
msg_info "   • Proxmox Backup Server einrichten"
msg_info "   • Automatische Container Snapshots"
msg_info "   • Off-site Backups (MinIO)"
msg_info ""
msg_info "4. Security:"
msg_info "   • Fail2ban aktivieren"
msg_info "   • Firewall Rules erstellen"
msg_info "   • SSL Zertifikate (Let's Encrypt)"
msg_info "   • 2FA aktivieren wo möglich"
