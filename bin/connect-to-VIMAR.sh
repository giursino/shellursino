#!/bin/sh
set -e

echo "Connecting to VIMAR VPN (please insert VIMAR password)..."
snx -s vpn.vimar.net -u ursinog

echo "Removing 192.168.1.x route from VIMAR VPN..."
sudo ip route del 192.168.1.1
sudo ip route del 192.168.1.7
sudo ip route del 192.168.1.8
sudo ip route del 192.168.1.10/31
sudo ip route del 192.168.1.16

echo "Removing 192.168.1.x route from VIMAR VPN..."
sudo ip route del 192.168.1.1
sudo ip route del 192.168.1.7
sudo ip route del 192.168.1.8
sudo ip route del 192.168.1.10/31
sudo ip route del 192.168.1.16

echo "Connecting to development machine..."
ssh -Y ursinog@vimar.net@172.20.32.15

echo "done..."
