#!/bin/bash
set -e
source /build/buildconfig
set -x

apt-get clean autoclean
apt-get autoremove -y
#rm -rf /var/lib/{apt,dpkg,cache,log}/
rm -rf /var/lib/log
rm -rf /var/lib/cache
rm -rf /var/lib/apt/lists
rm -rf /build
rm -rf /tmp/* /var/tmp/*
rm -f /etc/dpkg/dpkg.cfg.d/02apt-speedup
rm -f /etc/ssh/ssh_host_*
rm -rf /usr/share/man/??
rm -rf /usr/share/man/??_*
rm -rf /usr/share/doc
rm -rf /usr/share/locale
rm -rf /usr/share/i18n
