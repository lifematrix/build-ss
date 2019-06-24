#!/usr/bin/env bash

# install rng-tools
apt install rng-tools
echo "HRNGDEVICE=/dev/urandom" >> /etc/default/rng-tools

sudo adduser --system --no-create-home --group shadowsocks
sudo cp local.conf /etc/sysctl.d/local.conf

# create ss server
sudo mkdir -p -m 755 /etc/shadowsocks
sudo cp shadowsocks.json /etc/shadowsocks.json
sudo sysctl --system

# create systemd service
sudo cp shadowsocks.service /etc/systemd/system/shadowsocks.service
systemctl daemon-reload
systemctl enable shadowsocks
systemctl start shadowsocks

