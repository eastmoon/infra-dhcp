#!/bin/bash
set -e

## Install ISC DHCP Server
sudo apt-get update -y && sudo apt-get install -y isc-dhcp-server

## Modify ISC DHCP Server default setting
## Use network interface by virtualbox generated.
sudo sed -i 's/INTERFACESv4=""/INTERFACESv4="enp0s8"/g' /etc/default/isc-dhcp-server

## Modify dhcpd.conf
## Use CLI 'dhcpd' to check configure file has error or not
sudo cp /etc/dhcp/dhcpd.conf dhcp
sudo cat << EOF >> dhcp
option subnet-mask 255.255.255.0;
option broadcast-address 192.168.50.255;

subnet 192.168.50.0 netmask 255.255.255.0 {
range 192.168.50.101 192.168.50.150;
}
EOF
sudo cp dhcp /etc/dhcp/dhcpd.conf

## Start ISC DHCP Server
sudo systemctl enable isc-dhcp-server && sudo systemctl restart isc-dhcp-server

## Check DHCP Server status
sudo systemctl status isc-dhcp-server && sudo netstat -tulnp | grep dhcp
