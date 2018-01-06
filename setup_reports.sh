#!/bin/sh

# mao 2018-Jan-5 Simple stuff to create "build" environment

mkdir -p /tmp/weewx/html
mkdir -p /tmp/weewx/skins/oberlintv
cp -rv . /tmp/weewx/skins/oberlintv
cp -v ./weewx-test.conf  /etc/weewx/weewx.conf

# mao 2018-Jan-6 Give time to generate a few archive records
sleep 39
