#!/bin/bash

################################################################################
# Proxmox Netzwerk-Konfiguration Beispiele
################################################################################
#
# Beschreibung:
#   Beispiele für Netzwerk-Konfigurationen in Proxmox VE
#
################################################################################

################################################################################
# GRUNDLAGEN: /etc/network/interfaces
################################################################################
#
# Proxmox Netzwerk wird in /etc/network/interfaces konfiguriert
#
# Nach Änderungen anwenden:
#   ifreload -a
#   # ODER:
#   systemctl restart networking
#
################################################################################

################################################################################
# BEISPIEL 1: Einfache Bridge (Standard)
################################################################################
#
# /etc/network/interfaces:
#
# auto lo
# iface lo inet loopback
#
# auto eno1
# iface eno1 inet manual
#
# auto vmbr0
# iface vmbr0 inet static
#     address 192.168.1.10/24
#     gateway 192.168.1.1
#     bridge-ports eno1
#     bridge-stp off
#     bridge-fd 0
#
################################################################################

################################################################################
# BEISPIEL 2: VLAN-Konfiguration
################################################################################
#
# VLAN 10 für Management, VLAN 20 für VMs:
#
# auto eno1
# iface eno1 inet manual
#
# # VLAN 10 - Management
# auto eno1.10
# iface eno1.10 inet static
#     address 10.0.10.10/24
#     gateway 10.0.10.1
#
# # Bridge für VLAN 10
# auto vmbr10
# iface vmbr10 inet manual
#     bridge-ports eno1.10
#     bridge-stp off
#     bridge-fd 0
#
# # VLAN 20 - VMs
# auto eno1.20
# iface eno1.20 inet manual
#
# # Bridge für VLAN 20
# auto vmbr20
# iface vmbr20 inet manual
#     bridge-ports eno1.20
#     bridge-stp off
#     bridge-fd 0
#
################################################################################

################################################################################
# BEISPIEL 3: Bond (LACP) für Redundanz
################################################################################
#
# 2 Netzwerkkarten zu Bond zusammenfassen:
#
# # Bond installieren
# apt install ifenslave
#
# # Konfiguration:
# auto bond0
# iface bond0 inet manual
#     bond-slaves eno1 eno2
#     bond-mode 802.3ad        # LACP
#     bond-miimon 100
#     bond-downdelay 200
#     bond-updelay 200
#     bond-xmit-hash-policy layer3+4
#
# auto vmbr0
# iface vmbr0 inet static
#     address 192.168.1.10/24
#     gateway 192.168.1.1
#     bridge-ports bond0
#     bridge-stp off
#     bridge-fd 0
#
# # Switch muss LACP unterstützen!
#
################################################################################

################################################################################
# BEISPIEL 4: Mehrere IP-Adressen auf einer Bridge
################################################################################
#
# auto vmbr0
# iface vmbr0 inet static
#     address 192.168.1.10/24
#     gateway 192.168.1.1
#     bridge-ports eno1
#     bridge-stp off
#     bridge-fd 0
#
# # Zusätzliche IPs
# iface vmbr0 inet static
#     address 192.168.1.11/24
#
# iface vmbr0 inet static
#     address 192.168.1.12/24
#
################################################################################

################################################################################
# BEISPIEL 5: Isolierte Bridge (kein Internet)
################################################################################
#
# Für interne VM-Kommunikation ohne Internet-Zugang:
#
# auto vmbr1
# iface vmbr1 inet static
#     address 10.0.0.1/24
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#
# # VMs können sich nur untereinander erreichen!
#
################################################################################

################################################################################
# BEISPIEL 6: NAT für VMs (Masquerading)
################################################################################
#
# VMs erhalten Internetzugang über NAT:
#
# # Bridge ohne physisches Interface
# auto vmbr1
# iface vmbr1 inet static
#     address 10.0.0.1/24
#     bridge-ports none
#     bridge-stp off
#     bridge-fd 0
#     post-up echo 1 > /proc/sys/net/ipv4/ip_forward
#     post-up iptables -t nat -A POSTROUTING -s '10.0.0.0/24' -o vmbr0 -j MASQUERADE
#     post-down iptables -t nat -D POSTROUTING -s '10.0.0.0/24' -o vmbr0 -j MASQUERADE
#
################################################################################

################################################################################
# BEISPIEL 7: IPv6 Konfiguration
################################################################################
#
# auto vmbr0
# iface vmbr0 inet static
#     address 192.168.1.10/24
#     gateway 192.168.1.1
#     bridge-ports eno1
#     bridge-stp off
#     bridge-fd 0
#
# iface vmbr0 inet6 static
#     address 2001:db8::10/64
#     gateway 2001:db8::1
#
################################################################################

################################################################################
# BEISPIEL 8: OVS (Open vSwitch) - Erweitert
################################################################################
#
# Installation:
# apt install openvswitch-switch
#
# # OVS Bridge erstellen
# ovs-vsctl add-br vmbr0
# ovs-vsctl add-port vmbr0 eno1
#
# # In /etc/network/interfaces:
# auto eno1
# iface eno1 inet manual
#     ovs_bridge vmbr0
#     ovs_type OVSPort
#
# auto vmbr0
# allow-ovs vmbr0
# iface vmbr0 inet static
#     address 192.168.1.10/24
#     gateway 192.168.1.1
#     ovs_type OVSBridge
#     ovs_ports eno1
#
################################################################################

################################################################################
# NÜTZLICHE BEFEHLE
################################################################################
#
# Netzwerk-Status anzeigen:
#   ip addr show
#   ip link show
#   bridge link show
#
# Bridge-Informationen:
#   brctl show
#
# VLAN-Status:
#   cat /proc/net/vlan/config
#
# Netzwerk neu laden (ohne Reboot):
#   ifreload -a
#
# Test-Ping:
#   ping -c 4 8.8.8.8
#
# Routing-Tabelle:
#   ip route show
#
# Firewall-Status:
#   iptables -L -n -v
#
################################################################################

################################################################################
# FIREWALL-KONFIGURATION
################################################################################
#
# Proxmox hat eingebaute Firewall!
#
# Aktivierung:
#   1. Datacenter → Firewall → Enable
#   2. Node → Firewall → Enable
#   3. VM/CT → Firewall → Enable
#
# Standard-Regeln:
#   - ACCEPT: SSH (Port 22)
#   - ACCEPT: Proxmox Web (Port 8006)
#   - ACCEPT: ICMP (Ping)
#   - DROP: Alles andere
#
# Custom Rules über Web-UI oder:
#   /etc/pve/firewall/cluster.fw
#   /etc/pve/firewall/<VMID>.fw
#
################################################################################

################################################################################
# PERFORMANCE-TUNING
################################################################################
#
# MTU erhöhen (Jumbo Frames):
# auto vmbr0
# iface vmbr0 inet static
#     mtu 9000
#     bridge-ports eno1
#
# Multiqueue für VirtIO:
# qm set <VMID> --net0 virtio,bridge=vmbr0,queues=4
#
# TCP Offloading:
# ethtool -K eno1 tso on gso on gro on
#
################################################################################

################################################################################
# TROUBLESHOOTING
################################################################################
#
# Problem: Keine Netzwerk-Verbindung nach Änderungen
#   → ifreload -a
#   → systemctl restart networking
#   → Reboot als letzter Ausweg
#
# Problem: VMs haben kein Internet
#   → Bridge korrekt konfiguriert?
#   → Gateway in VM gesetzt?
#   → Firewall-Regeln prüfen
#   → IP-Forwarding aktiviert? (cat /proc/sys/net/ipv4/ip_forward)
#
# Problem: VLAN funktioniert nicht
#   → Switch unterstützt VLANs?
#   → VLAN auf Switch konfiguriert?
#   → Kabel richtig gesteckt?
#
# Problem: Bond funktioniert nicht
#   → LACP auf Switch aktiviert?
#   → Beide Kabel in gleicher Port-Group?
#   → bond-mode korrekt?
#
################################################################################

echo "🌐 Proxmox Netzwerk-Konfiguration Beispiele"
echo ""
echo "💡 Bearbeite /etc/network/interfaces für Änderungen"
echo ""
echo "⚠️  ACHTUNG: Falsche Netzwerk-Config kann SSH-Verbindung unterbrechen!"
echo "    → Immer über IPMI/KVM-Console testen!"
