#! /usr/bin/env bash

## Copy configuration and restart bind9
sudo rm -rf /etc/bind/zone.d
sudo cp -r ~/app/bind/* /etc/bind
sudo /etc/init.d/bind9 restart
sleep 3
sudo systemctl status bind9


## Test
host demodns.org localhost
host ns1.demodns.org localhost
host www.demodns.org localhost
host web.demodns.org localhost
host 192.168.1.100 localhost
host 192.168.0.50 localhost
host 192.168.0.100 localhost
