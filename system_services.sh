#!/bin/bash
set -e
source /build/buildconfig
set -x

## Install Python 2.
$minimal_apt_get_install python2.7

## Install init process.
cp /build/my_init /sbin/
mkdir -p /etc/my_init.d
mkdir -p /etc/container_environment
touch /etc/container_environment.sh
touch /etc/container_environment.json
chmod 700 /etc/container_environment
chmod 600 /etc/container_environment.sh /etc/container_environment.json

## Install runit.
touch /etc/inittab
$minimal_apt_get_install runit

## Install a syslog daemon.
$minimal_apt_get_install syslog-ng-core
mkdir /etc/service/syslog-ng
cp /build/runit/syslog-ng /etc/service/syslog-ng/run
mkdir -p /var/lib/syslog-ng
cp /build/config/syslog_ng_default /etc/default/syslog-ng

## Install logrotate.
$minimal_apt_get_install logrotate

## Install cron daemon.
$minimal_apt_get_install cron
mkdir /etc/service/cron
cp /build/runit/cron /etc/service/cron/run

## Remove useless cron entries.
# Checks for lost+found and scans for mtab.
#rm -f /etc/cron.daily/standard

$minimal_apt_get_install anacron
$minimal_apt_get_install salt-minion