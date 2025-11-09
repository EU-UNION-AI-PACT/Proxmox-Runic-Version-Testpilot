# 🚀 Proxmox VE Helper Scripts - Schnellstart-Guide

**Datum:** 9. November 2025

## 📋 Übersicht

Diese Sammlung enthält die wichtigsten Proxmox VE Helper Scripts, die Sie direkt in Ihrer Proxmox-Shell ausführen können.

## ⚡ Schnellstart

### 1. ProxMenux installieren (EMPFOHLEN für Anfänger)
```bash
bash -c "$(wget -qLO - https://raw.githubusercontent.com/MacRimi/ProxMenux/main/install_proxmenux.sh)"
```

### 2. Proxmox Post-Install optimieren
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/post-pve-install.sh)"
```

### 3. Alte Kernel aufräumen
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/kernel-clean.sh)"
```

### 4. Host-Backup erstellen
```bash
bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/misc/host-backup.sh)"
```

## 📁 Datei-Struktur

- `01-proxmenux-install.sh` - ProxMenux Installer
- `02-post-install.sh` - Proxmox VE Post-Installation
- `03-kernel-clean.sh` - Kernel-Cleanup
- `04-host-backup.sh` - Proxmox Host Backup
- `05-lxc-updater.sh` - LXC Container Updater
- `06-container-examples.sh` - Beispiele für LXC-Container-Erstellung
- `07-vm-examples.sh` - Beispiele für VM-Erstellung

## 🔗 Wichtige Links

- **Community Scripts:** https://community-scripts.github.io/ProxmoxVE/
- **GitHub Repository:** https://github.com/community-scripts/ProxmoxVE
- **ProxMenux:** https://github.com/MacRimi/ProxMenux
- **Awesome Proxmox VE:** https://github.com/Corsinvest/awesome-proxmox-ve

## ⚠️ Sicherheitshinweise

1. **Immer zuerst in einer Testumgebung testen!**
2. Vor dem Ausführen die Skripte überprüfen
3. Backups vor größeren Änderungen erstellen
4. Scripts nur aus vertrauenswürdigen Quellen verwenden

## 📚 Weitere Ressourcen

- Deutsche Anleitung: https://prokrastinerd.de/proxmox-anleitung/
- Proxmox Forum: https://forum.proxmox.com/
- Reddit: r/Proxmox

---
**Viel Erfolg mit Proxmox VE! 🎉**
