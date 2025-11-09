# Community Scripts - Komplette Übersicht

Diese Datei enthält ALLE verfügbaren Community Scripts für Proxmox VE, kategorisiert nach Anwendungsbereich.

**Quelle:** https://github.com/community-scripts/ProxmoxVE

**Gesamt:** 200+ Scripts für LXC Container und VMs

---

## 📊 Datenbanken & Storage (17 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Apache CouchDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/apache-couchdb.sh)"` |
| PostgreSQL | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/postgresql.sh)"` |
| MariaDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mariadb.sh)"` |
| MongoDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mongodb.sh)"` |
| Redis | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/redis.sh)"` |
| InfluxDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/influxdb.sh)"` |
| Neo4j | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/neo4j.sh)"` |
| SQL Server 2022 | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/sqlserver2022.sh)"` |
| PocketBase | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pocketbase.sh)"` |
| Meilisearch | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/meilisearch.sh)"` |
| MinIO | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/minio.sh)"` |
| Garage | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/garage.sh)"` |
| phpMyAdmin | Addon | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/phpmyadmin.sh)"` |

---

## 📈 Monitoring & Analytics (3 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Grafana | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/grafana.sh)"` |
| VictoriaMetrics | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/victoriametrics.sh)"` |
| InfluxDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/influxdb.sh)"` |

---

## 🏠 Home Automation (7 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Home Assistant (Helper) | LXC | Siehe vorherige Scripts |
| Homebridge | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/homebridge.sh)"` |
| ESPHome | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/esphome.sh)"` |
| FHEM | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/fhem.sh)"` |
| EVCC | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/evcc.sh)"` |
| Matterbridge | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/matterbridge.sh)"` |

---

## 🤖 AI & Automation (6 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| ComfyUI | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/comfyui.sh)"` |
| FlowiseAI | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/flowiseai.sh)"` |
| n8n | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/n8n.sh)"` |
| OpenWebUI | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/openwebui.sh)"` |
| LiteLLM | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/litellm.sh)"` |
| Livebook | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/livebook.sh)"` |

---

## 🔧 DevOps & Development (10 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Gitea | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/gitea.sh)"` |
| Forgejo | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/forgejo.sh)"` |
| Jenkins | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/jenkins.sh)"` |
| OneDev | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/onedev.sh)"` |
| Code Server | Addon | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/coder-code-server.sh)"` |
| .NET ASP Web API | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dotnetaspwebapi.sh)"` |
| OpenGist | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/opengist.sh)"` |

---

## 🌐 Reverse Proxy & Web Servers (6 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Nginx Proxy Manager | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nginxproxymanager.sh)"` |
| NPM Plus | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/npmplus.sh)"` |
| Caddy | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/caddy.sh)"` |
| Traefik | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/traefik.sh)"` |

---

## 🔐 Security & Auth (15 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Vaultwarden | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/vaultwarden.sh)"` |
| Authelia | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/authelia.sh)"` |
| Keycloak | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/keycloak.sh)"` |
| 2FAuth | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/2fauth.sh)"` |
| LLDAP | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/lldap.sh)"` |
| Zitadel | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/zitadel.sh)"` |
| OAuth2 Proxy | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/oauth2-proxy.sh)"` |
| PocketID | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pocketid.sh)"` |
| Infisical | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/infisical.sh)"` |
| OTS (One-Time Secret) | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/ots.sh)"` |
| CrowdSec | Addon | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/tools/addon/crowdsec.sh)"` |
| BunkerWeb | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/bunkerweb.sh)"` |

---

## 🌐 DNS & Network (11 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Pi-hole | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pihole.sh)"` |
| AdGuard Home | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/adguard.sh)"` |
| Blocky | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/blocky.sh)"` |
| Technitium DNS | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/technitiumdns.sh)"` |
| Unbound | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/unbound.sh)"` |
| Cloudflare DDNS | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cloudflare-ddns.sh)"` |
| Cloudflared | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cloudflared.sh)"` |
| Headscale | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/headscale.sh)"` |
| MeshCentral | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/meshcentral.sh)"` |
| Netbox | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/netbox.sh)"` |
| phpIPAM | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/phpipam.sh)"` |

---

## 📺 Media Management (Arr Stack - 20 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Radarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/radarr.sh)"` |
| Sonarr | LXC | Siehe vorherige Scripts |
| Lidarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/lidarr.sh)"` |
| Prowlarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/prowlarr.sh)"` |
| Bazarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/bazarr.sh)"` |
| Overseerr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/overseerr.sh)"` |
| Jellyseerr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/jellyseerr.sh)"` |
| Kapowarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/kapowarr.sh)"` |
| Mylar3 | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mylar3.sh)"` |
| Autobrr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/autobrr.sh)"` |
| Cross-Seed | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cross-seed.sh)"` |
| FlareSolverr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/flaresolverr.sh)"` |
| Recyclarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/recyclarr.sh)"` |
| Configarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/configarr.sh)"` |
| Cleanuparr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cleanuparr.sh)"` |
| Dispatcharr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dispatcharr.sh)"` |
| Huntarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/huntarr.sh)"` |
| Scraparr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/scraparr.sh)"` |
| Unmanic | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/unmanic.sh)"` |
| Notifiarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/notifiarr.sh)"` |

---

## 💼 Business & Productivity (25 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Nextcloud | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/nextcloud-vm.sh)"` |
| NextcloudPi | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nextcloudpi.sh)"` |
| NocoDB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nocodb.sh)"` |
| Ghost | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/ghost.sh)"` |
| Odoo | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/odoo.sh)"` |
| Dolibarr | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dolibarr.sh)"` |
| OpenProject | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/openproject.sh)"` |
| Mattermost | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/mattermost.sh)"` |
| Zammad | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/zammad.sh)"` |
| GLPI | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/glpi.sh)"` |
| ITSM-NG | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/itsm-ng.sh)"` |
| Snipe-IT | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/snipeit.sh)"` |
| Part-DB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/part-db.sh)"` |
| InvenTree | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/inventree.sh)"` |
| Kimai | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/kimai.sh)"` |
| LimeSurvey | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/limesurvey.sh)"` |
| Baikal | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/baikal.sh)"` |
| Radicale | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/radicale.sh)"` |
| Listmonk | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/listmonk.sh)"` |

---

## 💰 Finance & Budget (5 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Firefly III | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/firefly.sh)"` |
| Actual Budget | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/actualbudget.sh)"` |
| Ghostfolio | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/ghostfolio.sh)"` |
| Wallos | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/wallos.sh)"` |

---

## 🐳 Container Management (7 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Docker (LXC) | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/docker.sh)"` |
| Docker (VM) | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/docker-vm.sh)"` |
| Dockge | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/dockge.sh)"` |
| Portainer | LXC | Siehe vorherige Scripts |
| Komodo | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/komodo.sh)"` |
| CasaOS | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/casaos.sh)"` |
| Cosmos | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/cosmos.sh)"` |

---

## 🖥️ VMs & OS Templates (10 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Ubuntu 25.04 | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/ubuntu2504-vm.sh)"` |
| Debian 13 | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/debian-13-vm.sh)"` |
| Arch Linux | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/archlinux-vm.sh)"` |
| Alpine Linux | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/alpine.sh)"` |
| OpenWrt | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/openwrt-vm.sh)"` |
| MikroTik RouterOS | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/mikrotik-routeros.sh)"` |
| OwnCloud | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/owncloud-vm.sh)"` |
| Umbrel OS | VM | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/vm/umbrel-os-vm.sh)"` |
| Turnkey Linux | Multi | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/turnkey/turnkey.sh)"` |

---

## 🛠️ Tools & Utilities (15 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Apache Guacamole | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/apache-guacamole.sh)"` |
| RustDesk Server | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/rustdeskserver.sh)"` |
| Alpine IT Tools | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/alpine-it-tools.sh)"` |
| Traccar | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/traccar.sh)"` |
| LibreSpeed (Rust) | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/librespeed-rust.sh)"` |
| MySpeed | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/myspeed.sh)"` |
| MyIP | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/myip.sh)"` |
| Pi.Alert | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pialert.sh)"` |
| iVentoy | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/iventoy.sh)"` |
| SearXNG | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/searxng.sh)"` |
| LibreTranslate | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/libretranslate.sh)"` |

---

## 📞 Communication (7 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Element Synapse | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/elementsynapse.sh)"` |
| The Lounge | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/the-lounge.sh)"` |
| Asterisk | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/asterisk.sh)"` |
| FreePBX | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/freepbx.sh)"` |
| NodeBB | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/nodebb.sh)"` |

---

## 🏡 Self-Hosted Platforms (8 Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| YunoHost | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/yunohost.sh)"` |
| OpenMediaVault | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/omv.sh)"` |
| Runtipi | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/runtipi.sh)"` |
| Seelf | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/seelf.sh)"` |

---

## 🎯 Sonstige (20+ Scripts)

| Name | Typ | Befehl |
|------|-----|--------|
| Byteash | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/bytestash.sh)"` |
| Reitti | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/reitti.sh)"` |
| Pangolin | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/pangolin.sh)"` |
| Paymenter | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/paymenter.sh)"` |
| Fluid Calendar | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/fluid-calendar.sh)"` |
| BabyBuddy | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/babybuddy.sh)"` |
| Manage My Damn Life | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/managemydamnlife.sh)"` |
| GlobalLeaks | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/globaleaks.sh)"` |
| Peanut | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/peanut.sh)"` |
| GoAway | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/goaway.sh)"` |
| APT-Cacher NG | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/apt-cacher-ng.sh)"` |
| Kubo (IPFS) | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/kubo.sh)"` |
| HEV SOCKS5 Server | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/hev-socks5-server.sh)"` |
| OpenZiti Controller | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/openziti-controller.sh)"` |
| OpenZiti Tunnel | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/openziti-tunnel.sh)"` |
| Omada Controller | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/omada.sh)"` |
| Alpine TinyAuth | LXC | `bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/alpine-tinyauth.sh)"` |

---

## 📝 Verwendungshinweise

### Basis-Verwendung
```bash
# Einfach auf Proxmox-Host ausführen:
bash -c "$(curl -fsSL https://raw.githubusercontent.com/community-scripts/ProxmoxVE/main/ct/SCRIPTNAME.sh)"
```

### Wichtige Hinweise
- ✅ Alle Scripts sind **interaktiv** - folge den Anweisungen
- ✅ Scripts erstellen automatisch LXC Container oder VMs
- ✅ Standardwerte sind vorbelegt, können aber angepasst werden
- ✅ Container-IDs werden automatisch zugewiesen
- ⚠️ **Backups erstellen** vor Installation wichtiger Services!
- ⚠️ Einige Services benötigen viel RAM/CPU - prüfe Ressourcen

### Empfohlene Workflow
1. **Planung**: Entscheide welche Services du brauchst
2. **Ressourcen**: Prüfe verfügbaren RAM/CPU/Storage
3. **Netzwerk**: Plane IP-Adressen
4. **Installation**: Führe Scripts aus
5. **Konfiguration**: Post-Install Setup der Services
6. **Backup**: Erstelle Backups nach erfolgreicher Konfiguration

---

**Quelle & Updates:** https://github.com/community-scripts/ProxmoxVE
**Community:** https://forum.proxmox.com/
