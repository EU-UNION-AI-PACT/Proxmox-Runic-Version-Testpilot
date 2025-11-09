#!/usr/bin/env bash

# =============================================================================
# Proxmox Community Scripts - Datenbank Installation
# =============================================================================
# Dieses Script installiert verschiedene Datenbank-Container auf Proxmox VE
# Quelle: https://github.com/community-scripts/ProxmoxVE
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

msg_error() {
    echo -e "${RD}[ERROR]${CL} $1"
}

header_info() {
    cat <<"EOF"
    ____        __             __                     
   / __ \____ _/ /_____ ______/ /_  ____ _________  __
  / / / / __ `/ __/ __ `/ ___/ __ \/ __ `/ ___/ _ \/ /
 / /_/ / /_/ / /_/ /_/ / /__/ /_/ / /_/ /__  /  __/__ 
/_____/\__,_/\__/\__,_/\___/_.___/\__,_/____/\___/____/
                                                       
 Community Scripts - Datenbank Installation
EOF
}

clear
header_info
echo ""

msg_info "Verfügbare Datenbanken:"
echo ""
echo "  1) PostgreSQL        - Leistungsstarke relationale DB"
echo "  2) MariaDB           - MySQL-Fork, sehr populär"
echo "  3) MongoDB           - NoSQL Dokument-Datenbank"
echo "  4) Redis             - In-Memory Key-Value Store"
echo "  5) InfluxDB          - Zeitreihen-Datenbank"
echo "  6) Neo4j             - Graph-Datenbank"
echo "  7) Apache CouchDB    - NoSQL Dokument-DB mit HTTP API"
echo "  8) SQL Server 2022   - Microsoft SQL Server"
echo "  9) PocketBase        - SQLite Backend (Go)"
echo " 10) Meilisearch       - Suchmaschine (typo-tolerant)"
echo " 11) MinIO             - S3-kompatibles Object Storage"
echo " 12) Garage            - S3-kompatibles Distributed Storage"
echo ""
echo "  A) Alle installieren (PostgreSQL + MariaDB + Redis)"
echo "  C) Custom - Mehrfachauswahl"
echo "  0) Abbrechen"
echo ""

read -rp "Deine Auswahl: " choice

install_postgresql() {
    msg_info "Installiere PostgreSQL..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/postgresql.sh)"
}

install_mariadb() {
    msg_info "Installiere MariaDB..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mariadb.sh)"
}

install_mongodb() {
    msg_info "Installiere MongoDB..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mongodb.sh)"
}

install_redis() {
    msg_info "Installiere Redis..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/redis.sh)"
}

install_influxdb() {
    msg_info "Installiere InfluxDB..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/influxdb.sh)"
}

install_neo4j() {
    msg_info "Installiere Neo4j..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/neo4j.sh)"
}

install_couchdb() {
    msg_info "Installiere Apache CouchDB..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/apache-couchdb.sh)"
}

install_sqlserver() {
    msg_info "Installiere SQL Server 2022..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/sqlserver2022.sh)"
}

install_pocketbase() {
    msg_info "Installiere PocketBase..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pocketbase.sh)"
}

install_meilisearch() {
    msg_info "Installiere Meilisearch..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/meilisearch.sh)"
}

install_minio() {
    msg_info "Installiere MinIO..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/minio.sh)"
}

install_garage() {
    msg_info "Installiere Garage..."
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/garage.sh)"
}

case $choice in
    1) install_postgresql ;;
    2) install_mariadb ;;
    3) install_mongodb ;;
    4) install_redis ;;
    5) install_influxdb ;;
    6) install_neo4j ;;
    7) install_couchdb ;;
    8) install_sqlserver ;;
    9) install_pocketbase ;;
    10) install_meilisearch ;;
    11) install_minio ;;
    12) install_garage ;;
    A|a)
        msg_info "Installiere Standard-Stack (PostgreSQL + MariaDB + Redis)..."
        install_postgresql
        install_mariadb
        install_redis
        ;;
    C|c)
        echo ""
        msg_info "Gib die Nummern durch Leerzeichen getrennt ein (z.B.: 1 2 4):"
        read -rp "Auswahl: " selections
        for num in $selections; do
            case $num in
                1) install_postgresql ;;
                2) install_mariadb ;;
                3) install_mongodb ;;
                4) install_redis ;;
                5) install_influxdb ;;
                6) install_neo4j ;;
                7) install_couchdb ;;
                8) install_sqlserver ;;
                9) install_pocketbase ;;
                10) install_meilisearch ;;
                11) install_minio ;;
                12) install_garage ;;
                *) msg_error "Ungültige Auswahl: $num" ;;
            esac
        done
        ;;
    0)
        msg_info "Abgebrochen."
        exit 0
        ;;
    *)
        msg_error "Ungültige Auswahl!"
        exit 1
        ;;
esac

echo ""
msg_info "Installation abgeschlossen!"
msg_info "Denk daran, phpMyAdmin als Addon zu installieren:"
echo "  bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/phpmyadmin.sh)\""
