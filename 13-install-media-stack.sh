#!/usr/bin/env bash

# =============================================================================
# Proxmox Community Scripts - Complete Media Stack (Arr Apps)
# =============================================================================
# Installiert den kompletten Media Management Stack
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
    __  ___         ___        _____ __             __  
   /  |/  /__  ____/ (_)___ _ / ___// /_____ ______/ /__
  / /|_/ / _ \/ __  / / __ `/ \__ \/ __/ __ `/ ___/ //_/
 / /  / /  __/ /_/ / / /_/ / ___/ / /_/ /_/ / /__/ ,<   
/_/  /_/\___/\__,_/_/\__,_/ /____/\__/\__,_/\___/_/|_|  
                                                         
 Arr Stack - Complete Media Management
EOF
}

clear
header_info
echo ""

msg_info "Verfügbare Optionen:"
echo ""
echo "  1) Complete Stack     - Alle wichtigen Arr Apps"
echo "  2) Core Stack         - Radarr, Sonarr, Prowlarr, Overseerr"
echo "  3) Music Stack        - Lidarr + Unterstützung"
echo "  4) Custom             - Einzelauswahl"
echo "  0) Abbrechen"
echo ""

read -rp "Deine Auswahl: " choice

install_radarr() {
    msg_info "Installiere Radarr (Movies)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/radarr.sh)"
}

install_lidarr() {
    msg_info "Installiere Lidarr (Music)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/lidarr.sh)"
}

install_prowlarr() {
    msg_info "Installiere Prowlarr (Indexer Manager)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/prowlarr.sh)"
}

install_bazarr() {
    msg_info "Installiere Bazarr (Subtitles)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/bazarr.sh)"
}

install_overseerr() {
    msg_info "Installiere Overseerr (Request Management)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/overseerr.sh)"
}

install_jellyseerr() {
    msg_info "Installiere Jellyseerr (Alternative zu Overseerr)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/jellyseerr.sh)"
}

install_recyclarr() {
    msg_info "Installiere Recyclarr (Config Sync)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/recyclarr.sh)"
}

install_autobrr() {
    msg_info "Installiere Autobrr (Release Automation)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/autobrr.sh)"
}

install_notifiarr() {
    msg_info "Installiere Notifiarr (Notifications)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/notifiarr.sh)"
}

install_flaresolverr() {
    msg_info "Installiere FlareSolverr (Cloudflare Bypass)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/flaresolverr.sh)"
}

install_unmanic() {
    msg_info "Installiere Unmanic (Media Transcoding)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/unmanic.sh)"
}

install_mylar3() {
    msg_info "Installiere Mylar3 (Comics)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mylar3.sh)"
}

install_kapowarr() {
    msg_info "Installiere Kapowarr (Comics - Modern)..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/kapowarr.sh)"
}

install_complete_stack() {
    msg_info "Installiere Complete Media Stack..."
    install_prowlarr
    install_radarr
    install_lidarr
    install_bazarr
    install_overseerr
    install_recyclarr
    install_autobrr
    install_flaresolverr
    install_notifiarr
}

install_core_stack() {
    msg_info "Installiere Core Media Stack..."
    install_prowlarr
    install_radarr
    install_overseerr
}

install_music_stack() {
    msg_info "Installiere Music Stack..."
    install_lidarr
    install_prowlarr
}

case $choice in
    1) install_complete_stack ;;
    2) install_core_stack ;;
    3) install_music_stack ;;
    4)
        echo ""
        msg_info "Einzelne Apps:"
        echo " 1) Radarr        7) Recyclarr      13) Kapowarr"
        echo " 2) Lidarr        8) Autobrr        14) Cross-Seed"
        echo " 3) Prowlarr      9) Notifiarr      15) Huntarr"
        echo " 4) Bazarr       10) FlareSolverr   16) Dispatcharr"
        echo " 5) Overseerr    11) Unmanic        17) Cleanuparr"
        echo " 6) Jellyseerr   12) Mylar3         18) Scraparr"
        echo ""
        read -rp "Nummern (Leerzeichen getrennt): " selections
        for num in $selections; do
            case $num in
                1) install_radarr ;;
                2) install_lidarr ;;
                3) install_prowlarr ;;
                4) install_bazarr ;;
                5) install_overseerr ;;
                6) install_jellyseerr ;;
                7) install_recyclarr ;;
                8) install_autobrr ;;
                9) install_notifiarr ;;
                10) install_flaresolverr ;;
                11) install_unmanic ;;
                12) install_mylar3 ;;
                13) install_kapowarr ;;
                14) bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cross-seed.sh)" ;;
                15) bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/huntarr.sh)" ;;
                16) bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dispatcharr.sh)" ;;
                17) bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cleanuparr.sh)" ;;
                18) bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/scraparr.sh)" ;;
            esac
        done
        ;;
    0)
        msg_info "Abgebrochen."
        exit 0
        ;;
    *)
        echo "Ungültige Auswahl!"
        exit 1
        ;;
esac

echo ""
msg_info "✅ Media Stack Installation abgeschlossen!"
msg_info ""
msg_info "Nächste Schritte:"
msg_info "  1. Konfiguriere Prowlarr Indexer"
msg_info "  2. Verbinde Radarr/Sonarr/Lidarr mit Prowlarr"
msg_info "  3. Richte Download-Clients ein (qBittorrent/SABnzbd)"
msg_info "  4. Konfiguriere Overseerr für User-Requests"
