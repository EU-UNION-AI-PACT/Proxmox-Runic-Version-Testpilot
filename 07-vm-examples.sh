#!/bin/bash

################################################################################
# VM (Virtual Machine) Erstellungs-Beispiele
################################################################################
#
# Beschreibung:
#   Beispiele zur Erstellung von VMs mit Cloud-Init und Helper Scripts
#
# Verwendung:
#   1. Beispiel auswählen
#   2. VMID, Namen und Ressourcen anpassen
#   3. In Proxmox Shell kopieren und ausführen
#
################################################################################

################################################################################
# BEISPIEL 1: Home Assistant OS VM
################################################################################
#
# Vollwertiges Home Assistant OS:
#
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/vm/haos-vm.sh)"
#
# Features:
#   - Komplettes HAOS
#   - Auto-Update
#   - Add-ons Support
#   - Supervisor
#
################################################################################

################################################################################
# BEISPIEL 2: Ubuntu 24.04 VM mit Cloud-Init
################################################################################
#
# Ubuntu Server VM erstellen:
#
# # 1. Cloud Image herunterladen
# wget https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img
#
# # 2. VM erstellen
# qm create 200 --name ubuntu-vm --memory 2048 --cores 2 --net0 virtio,bridge=vmbr0
#
# # 3. Disk importieren
# qm importdisk 200 ubuntu-24.04-server-cloudimg-amd64.img local-lvm
#
# # 4. Disk zuweisen
# qm set 200 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-200-disk-0
#
# # 5. Cloud-Init Drive
# qm set 200 --ide2 local-lvm:cloudinit
#
# # 6. Boot-Order
# qm set 200 --boot c --bootdisk scsi0
#
# # 7. Cloud-Init Konfiguration
# qm set 200 --ciuser admin --sshkey ~/.ssh/id_rsa.pub
#
# # 8. VM starten
# qm start 200
#
################################################################################

################################################################################
# BEISPIEL 3: Windows 11 VM
################################################################################
#
# Windows 11 VM erstellen:
#
# # 1. Windows 11 ISO hochladen nach local:iso/
#
# # 2. VM erstellen
# qm create 201 \
#   --name windows11 \
#   --memory 4096 \
#   --cores 4 \
#   --scsihw virtio-scsi-pci \
#   --scsi0 local-lvm:100 \
#   --net0 virtio,bridge=vmbr0 \
#   --ostype win11 \
#   --cpu host \
#   --bios ovmf \
#   --machine q35 \
#   --efidisk0 local-lvm:1,efitype=4m,pre-enrolled-keys=1 \
#   --tpmstate0 local-lvm:1,version=v2.0
#
# # 3. ISO mounten
# qm set 201 --ide2 local:iso/Win11_23H2_German_x64.iso,media=cdrom
#
# # 4. VirtIO Treiber-ISO mounten
# qm set 201 --ide0 local:iso/virtio-win.iso,media=cdrom
#
# # 5. VM starten und Installation durchführen
# qm start 201
#
################################################################################

################################################################################
# BEISPIEL 4: Debian 12 VM (minimal)
################################################################################
#
# Debian VM mit Cloud-Init:
#
# # Cloud Image Download
# wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-genericcloud-amd64.qcow2
#
# # VM erstellen
# qm create 202 --name debian12 --memory 1024 --cores 1 --net0 virtio,bridge=vmbr0
# qm importdisk 202 debian-12-genericcloud-amd64.qcow2 local-lvm
# qm set 202 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-202-disk-0
# qm set 202 --ide2 local-lvm:cloudinit
# qm set 202 --boot c --bootdisk scsi0
# qm set 202 --serial0 socket --vga serial0
# qm set 202 --ciuser debian --cipassword ChangeMe123
# qm resize 202 scsi0 +20G
# qm start 202
#
################################################################################

################################################################################
# BEISPIEL 5: pfSense Firewall VM
################################################################################
#
# pfSense Firewall erstellen:
#
# # 1. pfSense ISO hochladen
#
# # 2. VM mit 2 NICs erstellen (WAN + LAN)
# qm create 203 \
#   --name pfsense \
#   --memory 2048 \
#   --cores 2 \
#   --scsihw virtio-scsi-pci \
#   --scsi0 local-lvm:32 \
#   --net0 virtio,bridge=vmbr0 \
#   --net1 virtio,bridge=vmbr1 \
#   --ostype other
#
# # 3. ISO mounten
# qm set 203 --ide2 local:iso/pfSense-CE-2.7.2-RELEASE-amd64.iso,media=cdrom
#
# # 4. Installation starten
# qm start 203
#
################################################################################

################################################################################
# BEISPIEL 6: TrueNAS Scale VM
################################################################################
#
# TrueNAS für Storage/NAS:
#
# # 1. TrueNAS Scale ISO hochladen
#
# # 2. VM mit viel RAM erstellen
# qm create 204 \
#   --name truenas \
#   --memory 16384 \
#   --cores 4 \
#   --scsihw virtio-scsi-pci \
#   --scsi0 local-lvm:50 \
#   --net0 virtio,bridge=vmbr0 \
#   --ostype l26
#
# # 3. ISO mounten
# qm set 204 --ide2 local:iso/TrueNAS-SCALE-24.04.0.iso,media=cdrom
#
# # 4. Weitere Disks für Storage hinzufügen (Passthrough empfohlen!)
#
# # 5. Installation starten
# qm start 204
#
################################################################################

################################################################################
# BEISPIEL 7: OPNsense Firewall VM
################################################################################
#
# OPNsense als Alternative zu pfSense:
#
# # VM mit 2 NICs
# qm create 205 \
#   --name opnsense \
#   --memory 2048 \
#   --cores 2 \
#   --scsihw virtio-scsi-pci \
#   --scsi0 local-lvm:32 \
#   --net0 virtio,bridge=vmbr0,firewall=0 \
#   --net1 virtio,bridge=vmbr1,firewall=0 \
#   --ostype other
#
# qm set 205 --ide2 local:iso/OPNsense-24.1-dvd-amd64.iso,media=cdrom
# qm start 205
#
################################################################################

################################################################################
# BEISPIEL 8: macOS VM (OSX-Proxmox)
################################################################################
#
# macOS in Proxmox (komplexe Installation!):
#
# # Spezielle Anleitung erforderlich
# # Siehe: https://github.com/kholia/OSX-KVM
#
# # ODER mit Helper Script:
# bash -c "$(wget -qLO - https://github.com/community-scripts/ProxmoxVE/raw/main/vm/macos-vm.sh)"
#
################################################################################

################################################################################
# ERWEITERTE VM-FUNKTIONEN
################################################################################
#
# GPU Passthrough:
#   1. IOMMU aktivieren (GRUB/Kernel)
#   2. GPU von Host unbinden
#   3. VFIO-Module laden
#   4. GPU zur VM hinzufügen
#
# USB Passthrough:
#   qm set <VMID> --usb0 host=1234:5678
#
# Disk Passthrough (ganze Disk):
#   qm set <VMID> --scsi1 /dev/disk/by-id/ata-XXXXXXX
#
# Snapshots:
#   qm snapshot <VMID> <NAME>
#   qm rollback <VMID> <NAME>
#
# VM klonen:
#   qm clone <SOURCE-VMID> <NEW-VMID> --name new-vm
#
################################################################################

################################################################################
# TEMPLATE ERSTELLEN
################################################################################
#
# 1. VM vorbereiten:
#    - Cloud-Init installieren
#    - System aufräumen
#    - Passwörter entfernen
#
# 2. VM in Template konvertieren:
#    qm template <VMID>
#
# 3. Aus Template klonen:
#    qm clone <TEMPLATE-ID> <NEW-VMID> --name new-vm --full
#
################################################################################

################################################################################
# AUTOMATISIERUNG MIT TERRAFORM
################################################################################
#
# Terraform Provider für Proxmox:
#   https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
#
# Beispiel terraform.tf:
#
# resource "proxmox_vm_qemu" "ubuntu" {
#   name        = "ubuntu-vm"
#   target_node = "pve"
#   clone       = "ubuntu-template"
#   cores       = 2
#   memory      = 2048
#   disk {
#     size    = "20G"
#     type    = "scsi"
#     storage = "local-lvm"
#   }
# }
#
################################################################################

echo "💡 Dieser Script enthält BEISPIELE für VM-Erstellung"
echo ""
echo "📖 Öffne diese Datei in einem Editor und kopiere die gewünschten Befehle"
echo ""
echo "🌐 Alle verfügbaren Scripts: https://community-scripts.github.io/ProxmoxVE/"
