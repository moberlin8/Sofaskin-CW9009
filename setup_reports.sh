#!/bin/sh

# mao 2018-Jan-5 Simple stuff to create "build" environment

mkdir -p /tmp/weewx/html
mkdir -p /tmp/weewx/skins/oberlintv
cp -rv . /tmp/weewx/skins/oberlintv
cp -v ./weewx-test.conf  /etc/weewx/weewx.conf
# mao 2018-Jan-6 Make sure we pickup new config
sudo service weewx restart
