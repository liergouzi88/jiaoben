#!/bin/bash

# 安装Squid代理服务器
sudo apt update
sudo apt install -y squid

# 备份原始的Squid配置文件
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.bak

# 编辑Squid配置文件
sudo sed -i 's/http_port 3128/http_port 1515/g' /etc/squid/squid.conf
sudo sed -i 's/http_access deny all/http_access allow all/g' /etc/squid/squid.conf

# 重启Squid服务以应用新的配置
sudo systemctl restart squid

# 设置Squid服务在系统启动时自动启动
sudo systemctl enable squid

echo "Squid代理服务器已成功安装并配置，端口号为1515。"