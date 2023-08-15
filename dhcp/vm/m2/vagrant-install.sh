#!/bin/bash
set -e

## Update kernel
### Ref: https://phoenixnap.com/kb/how-to-update-kernel-ubuntu
sudo apt-get update -y

## Network setting
#### 顯示當前 TCP/UDP 監聽的 Port
sudo netstat -tunlp
#### 關閉無用的網路服務, 例如  avahi-daemon
#sudo systemctl stop avahi-daemon
#sudo systemctl disable avahi-daemon
#### 校正 NTP
sudo apt-get install -y chrony
##### 顯示當前時間資訊
sudo timedatectl
##### 關閉舊 NTP 資源設定並改用 google 校時伺服器
sudo sed -i "s/^pool/#pool/g" /etc/chrony/chrony.conf
sudo sed -i "s/^server/#server/g" /etc/chrony/chrony.conf
echo "server time.google.com iburst" | sudo tee -a /etc/chrony/chrony.conf
echo "server time1.google.com iburst" | sudo tee -a /etc/chrony/chrony.conf
echo "server time2.google.com iburst" | sudo tee -a /etc/chrony/chrony.conf
echo "server time3.google.com iburst" | sudo tee -a /etc/chrony/chrony.conf
echo "server time4.google.com iburst" | sudo tee -a /etc/chrony/chrony.conf
sudo systemctl restart chronyd
##### 顯示可用的 NTP 校對來源
chronyc sources
