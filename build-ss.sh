#!/usr/bin/env bash

apt update && apt upgrade -yuf
apt install -y --no-install-recommends gettext build-essential autoconf libtool libpcre3-dev \
                                       asciidoc xmlto libev-dev libudns-dev automake libmbedtls-dev \
                                       libsodium-dev git python-m2crypto libc-ares-dev

cd /opt
git clone https://github.com/shadowsocks/shadowsocks-libev.git

cd shadowsocks-libev
git submodule update --init --recursive

./autogen.sh
./configure
make && make install

