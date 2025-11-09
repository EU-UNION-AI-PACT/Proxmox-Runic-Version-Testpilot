#!/usr/bin/env bash

# =============================================================================
# Proxmox Community Scripts - Security & Authentication Stack
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
   _____                      _ __         
  / ___/___  _______  _______(_) /___  __  
  \__ \/ _ \/ ___/ / / / ___/ / __/ / / /  
 ___/ /  __/ /__/ /_/ / /  / / /_/ /_/ /   
/____/\___/\___/\__,_/_/  /_/\__/\__, /    
                                /____/     
 Security & Authentication Stack
EOF
}

clear
header_info
echo ""

msg_info "Verfügbare Security Stacks:"
echo ""
echo "  1) Complete Security Stack"
echo "     (Vaultwarden + Authelia + 2FAuth + LLDAP + CrowdSec)"
echo ""
echo "  2) Password Manager"
echo "     (Vaultwarden - Bitwarden kompatibel)"
echo ""
echo "  3) SSO & Authentication"
echo "     (Authelia + LLDAP)"
echo ""
echo "  4) Enterprise Auth"
echo "     (Keycloak + Zitadel)"
echo ""
echo "  5) DNS Security"
echo "     (Pi-hole + AdGuard + Blocky)"
echo ""
echo "  6) Web Security"
echo "     (BunkerWeb + CrowdSec + Authelia)"
echo ""
echo "  7) Custom - Einzelauswahl"
echo "  0) Abbrechen"
echo ""

read -rp "Deine Auswahl: " choice

install_vaultwarden() {
    msg_info "Installiere Vaultwarden..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/vaultwarden.sh)"
}

install_authelia() {
    msg_info "Installiere Authelia..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/authelia.sh)"
}

install_2fauth() {
    msg_info "Installiere 2FAuth..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/2fauth.sh)"
}

install_lldap() {
    msg_info "Installiere LLDAP..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/lldap.sh)"
}

install_keycloak() {
    msg_info "Installiere Keycloak..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/keycloak.sh)"
}

install_zitadel() {
    msg_info "Installiere Zitadel..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/zitadel.sh)"
}

install_crowdsec() {
    msg_info "Installiere CrowdSec..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/crowdsec.sh)"
}

install_bunkerweb() {
    msg_info "Installiere BunkerWeb..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/bunkerweb.sh)"
}

install_pihole() {
    msg_info "Installiere Pi-hole..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pihole.sh)"
}

install_adguard() {
    msg_info "Installiere AdGuard Home..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/adguard.sh)"
}

install_blocky() {
    msg_info "Installiere Blocky..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/blocky.sh)"
}

install_oauth2proxy() {
    msg_info "Installiere OAuth2 Proxy..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/oauth2-proxy.sh)"
}

install_pocketid() {
    msg_info "Installiere PocketID..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pocketid.sh)"
}

install_infisical() {
    msg_info "Installiere Infisical..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/infisical.sh)"
}

install_ots() {
    msg_info "Installiere One-Time Secret..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/ots.sh)"
}

case $choice in
    1)
        msg_info "Installiere Complete Security Stack..."
        install_vaultwarden
        install_authelia
        install_2fauth
        install_lldap
        install_crowdsec
        ;;
    2)
        install_vaultwarden
        ;;
    3)
        install_authelia
        install_lldap
        ;;
    4)
        install_keycloak
        install_zitadel
        ;;
    5)
        install_pihole
        install_adguard
        install_blocky
        ;;
    6)
        install_bunkerweb
        install_crowdsec
        install_authelia
        ;;
    7)
        echo ""
        msg_info "Verfügbare Security Apps:"
        echo "  1) Vaultwarden      8) OAuth2 Proxy"
        echo "  2) Authelia         9) PocketID"
        echo "  3) 2FAuth          10) Infisical"
        echo "  4) LLDAP           11) One-Time Secret"
        echo "  5) Keycloak        12) Pi-hole"
        echo "  6) Zitadel         13) AdGuard Home"
        echo "  7) CrowdSec        14) Blocky"
        echo "                     15) BunkerWeb"
        echo ""
        read -rp "Nummern (Leerzeichen getrennt): " selections
        for num in $selections; do
            case $num in
                1) install_vaultwarden ;;
                2) install_authelia ;;
                3) install_2fauth ;;
                4) install_lldap ;;
                5) install_keycloak ;;
                6) install_zitadel ;;
                7) install_crowdsec ;;
                8) install_oauth2proxy ;;
                9) install_pocketid ;;
                10) install_infisical ;;
                11) install_ots ;;
                12) install_pihole ;;
                13) install_adguard ;;
                14) install_blocky ;;
                15) install_bunkerweb ;;
            esac
        done
        ;;
    0)
        msg_info "Abgebrochen."
        exit 0
        ;;
esac

echo ""
msg_info "✅ Security Stack Installation abgeschlossen!"
msg_info ""
msg_info "Wichtige Post-Install Schritte:"
msg_info "  • Authelia: Konfiguriere config.yml und users_database.yml"
msg_info "  • LLDAP: Erstelle Admin-User und Gruppen"
msg_info "  • Vaultwarden: HTTPS mit Reverse Proxy konfigurieren"
msg_info "  • CrowdSec: Bouncer für Nginx/Caddy installieren"
