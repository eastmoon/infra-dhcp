#!/bin/bash
set -e

## Update kernel
sudo yum update -y kernel

## Network setting
### Ref, https://www.tecmint.com/install-netstat-in-linux/
sudo yum install -y net-tools
#### 顯示當前 TCP/UDP 監聽的 Port
sudo netstat -tunlp
#### 關閉無用的網路服務, 例如 avahi-daemon
#sudo systemctl stop avahi-daemon
#sudo systemctl disable avahi-daemon
#### 校正 NTP
##### 顯示當前時間資訊
sudo timedatectl
##### 關閉舊 NTP 資源設定並改用 google 校時伺服器
sudo sed -i "s/^server/#server/g" /etc/chrony.conf
echo "server time.google.com iburst" | sudo tee -a /etc/chrony.conf
echo "server time1.google.com iburst" | sudo tee -a /etc/chrony.conf
echo "server time2.google.com iburst" | sudo tee -a /etc/chrony.conf
echo "server time3.google.com iburst" | sudo tee -a /etc/chrony.conf
echo "server time4.google.com iburst" | sudo tee -a /etc/chrony.conf
sudo systemctl restart chronyd
##### 顯示可用的 NTP 校對來源
chronyc sources
