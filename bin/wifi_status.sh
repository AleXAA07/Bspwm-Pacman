#!/bin/sh

echo "%{F#7dcfff}  %{F#C5C8C6}$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk "{print \$2}")%{u-}"
