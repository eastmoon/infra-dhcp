#!/bin/bash
set -e

## Install ISC DHCP Server
sudo apt-get update -y && sudo apt-get install -y bind9 bind9-doc dnsutils
