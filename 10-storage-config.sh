#!/bin/bash

################################################################################
# Proxmox Storage-Konfiguration
################################################################################
#
# Beschreibung:
#   Beispiele für Storage-Konfigurationen in Proxmox VE
#
################################################################################

################################################################################
# STORAGE-TYPEN ÜBERSICHT
################################################################################
#
# Proxmox unterstützt:
#   - Directory (lokal)
#   - LVM / LVM-Thin
#   - ZFS
#   - Ceph
#   - NFS
#   - SMB/CIFS
#   - GlusterFS
#   - iSCSI
#
# Konfiguration: /etc/pve/storage.cfg
#
################################################################################

################################################################################
# BEISPIEL 1: Zusätzliches Directory Storage
################################################################################
#
# Neues Verzeichnis als Storage hinzufügen:
#
# pvesm add dir backup-storage --path /mnt/backup --content backup,iso
#
# Oder in /etc/pve/storage.cfg:
#
# dir: backup-storage
#     path /mnt/backup
#     content backup,iso
#     maxfiles 10
#
################################################################################

################################################################################
# BEISPIEL 2: NFS Storage einbinden
################################################################################
#
# NFS-Server: 192.168.1.100:/mnt/proxmox-share
#
# Via CLI:
# pvesm add nfs nfs-storage --server 192.168.1.100 --export /mnt/proxmox-share --content backup,iso,vztmpl
#
# Oder in /etc/pve/storage.cfg:
#
# nfs: nfs-storage
#     export /mnt/proxmox-share
#     path /mnt/pve/nfs-storage
#     server 192.168.1.100
#     content backup,iso,vztmpl
#     options vers=4.2
#
# NFS-Server einrichten (Debian/Ubuntu):
#   apt install nfs-kernel-server
#   echo "/mnt/proxmox-share 192.168.1.0/24(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
#   exportfs -ra
#   systemctl restart nfs-server
#
################################################################################

################################################################################
# BEISPIEL 3: SMB/CIFS Storage (Windows-Share)
################################################################################
#
# Windows-Share einbinden:
#
# pvesm add cifs smb-storage \
#   --server 192.168.1.200 \
#   --share Proxmox \
#   --username proxmox \
#   --password MeinPasswort \
#   --content backup,iso
#
# Oder manuell mounten:
#   apt install cifs-utils
#   mkdir /mnt/smb-share
#   mount -t cifs //192.168.1.200/Proxmox /mnt/smb-share -o username=proxmox,password=MeinPasswort
#
# Permanent in /etc/fstab:
#   //192.168.1.200/Proxmox /mnt/smb-share cifs username=proxmox,password=MeinPasswort,uid=0,gid=0 0 0
#
################################################################################

################################################################################
# BEISPIEL 4: ZFS Pool erstellen
################################################################################
#
# ZFS installieren:
# apt install zfsutils-linux
#
# Einzelne Disk als ZFS:
# zpool create tank /dev/sdb
# pvesm add zfspool tank-storage --pool tank --content rootdir,images
#
# ZFS Mirror (RAID1):
# zpool create tank mirror /dev/sdb /dev/sdc
#
# ZFS RAIDZ (RAID5):
# zpool create tank raidz /dev/sdb /dev/sdc /dev/sdd
#
# ZFS RAIDZ2 (RAID6):
# zpool create tank raidz2 /dev/sdb /dev/sdc /dev/sdd /dev/sde
#
# ZFS-Status:
#   zpool status
#   zpool list
#   zfs list
#
################################################################################

################################################################################
# BEISPIEL 5: LVM-Thin Storage
################################################################################
#
# LVM-Thin ist Standard bei Proxmox Installation
#
# Neue Disk als LVM-Thin hinzufügen:
#
# 1. Physical Volume erstellen:
#    pvcreate /dev/sdb
#
# 2. Volume Group erstellen:
#    vgcreate vg-data /dev/sdb
#
# 3. Thin Pool erstellen:
#    lvcreate -L 100G -T vg-data/thin-pool
#
# 4. In Proxmox registrieren:
#    pvesm add lvmthin thin-storage --vgname vg-data --thinpool thin-pool --content rootdir,images
#
# Status anzeigen:
#   pvs
#   vgs
#   lvs
#
################################################################################

################################################################################
# BEISPIEL 6: iSCSI Storage einbinden
################################################################################
#
# iSCSI Target Discovery:
# iscsiadm -m discovery -t sendtargets -p 192.168.1.100:3260
#
# iSCSI Login:
# iscsiadm -m node --targetname iqn.2024-01.com.example:storage --portal 192.168.1.100:3260 --login
#
# In Proxmox einbinden:
# pvesm add iscsi iscsi-storage --portal 192.168.1.100:3260 --target iqn.2024-01.com.example:storage
#
################################################################################

################################################################################
# BEISPIEL 7: Ceph Storage (Cluster)
################################################################################
#
# Ceph Installation (mindestens 3 Nodes!):
#
# pveceph install
# pveceph init --network 10.0.0.0/24
# pveceph mon create
#
# OSD erstellen (pro Disk auf jedem Node):
# pveceph osd create /dev/sdb
#
# Pool erstellen:
# pveceph pool create vm-pool --size 3 --min_size 2
#
# In Proxmox einbinden:
# pvesm add rbd ceph-storage --pool vm-pool --content rootdir,images
#
################################################################################

################################################################################
# STORAGE MIGRATION
################################################################################
#
# VM Storage migrieren:
# qm move_disk <VMID> <disk> <target-storage>
#
# Beispiel:
# qm move_disk 100 scsi0 new-storage
#
# Container Storage migrieren:
# pct move_volume <CTID> <volume> <target-storage>
#
# Beispiel:
# pct move_volume 100 rootfs new-storage
#
################################################################################

################################################################################
# BACKUP STORAGE BEST PRACTICES
################################################################################
#
# 1. Separates Backup-Storage verwenden
#    → NFS/SMB auf separatem Server
#    → Proxmox Backup Server (PBS)
#
# 2. Retention Policy einstellen
#    Datacenter → Storage → Edit → Backup Retention
#    - Keep last: 7 (letzte 7 Backups)
#    - Keep daily: 30
#    - Keep weekly: 12
#    - Keep monthly: 12
#
# 3. Backup-Zeitplan
#    Datacenter → Backup → Add
#    - Zeit: 02:00 (nachts)
#    - Mode: Snapshot (schnell, kein Downtime)
#    - Compression: ZSTD (gut für moderne CPUs)
#
################################################################################

################################################################################
# PERFORMANCE-OPTIMIERUNG
################################################################################
#
# ZFS Tuning:
#   # ARC-Cache begrenzen (16GB RAM reservieren)
#   echo "options zfs zfs_arc_max=17179869184" > /etc/modprobe.d/zfs.conf
#   update-initramfs -u -k all
#
# LVM-Thin Monitoring:
#   lvs -a
#   # Bei >80% Auslastung: Pool erweitern
#   lvextend -L +50G vg-data/thin-pool
#
# NFS Performance:
#   # In /etc/pve/storage.cfg:
#   options vers=4.2,async,noatime
#
################################################################################

################################################################################
# STORAGE CLEANUP
################################################################################
#
# Ungenutzte Volumes finden:
# pvesm list <storage> | grep "orphaned"
#
# Disk-Images aufräumen:
# qm cleanup <VMID>
#
# Template-Cache leeren:
# pveam update
# rm /var/lib/vz/template/cache/*
#
# LVM-Thin Trim (Speicher freigeben):
# fstrim -av
#
################################################################################

################################################################################
# MONITORING & ALERTS
################################################################################
#
# Storage-Auslastung überwachen:
# df -h
# zpool list
# lvs
#
# Alert bei 80% Auslastung einrichten:
#   Datacenter → Notifications
#   → Storage threshold: 80%
#
# Script für tägliche Storage-Reports:
#
# #!/bin/bash
# {
#   echo "=== Proxmox Storage Report $(date) ==="
#   echo ""
#   echo "=== Disks ==="
#   df -h | grep -E 'Filesystem|/dev/'
#   echo ""
#   echo "=== ZFS Pools ==="
#   zpool list 2>/dev/null || echo "No ZFS pools"
#   echo ""
#   echo "=== LVM ==="
#   lvs
# } | mail -s "Daily Storage Report" admin@example.com
#
################################################################################

################################################################################
# TROUBLESHOOTING
################################################################################
#
# Problem: Storage voll
#   → Alte Backups löschen
#   → Snapshots entfernen
#   → Ungenutzte VMs/Container löschen
#   → Storage erweitern
#
# Problem: NFS-Mount hängt
#   → umount -f /mnt/nfs-storage
#   → systemctl restart nfs-client.target
#   → mount -a
#
# Problem: ZFS Pool degraded
#   → zpool status (Details anzeigen)
#   → zpool replace <pool> <old-disk> <new-disk>
#
# Problem: LVM-Thin überfüllt
#   → lvextend -L +50G vg-data/thin-pool
#
################################################################################

echo "💾 Proxmox Storage-Konfiguration"
echo ""
echo "📊 Aktueller Storage-Status:"
pvesm status
echo ""
echo "💡 Siehe /etc/pve/storage.cfg für Details"
