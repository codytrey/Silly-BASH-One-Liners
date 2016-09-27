#!/bin/bash

# Create /etc/resolve.conf in cygwin needed for dig/bind utils
ipconfig /all > /tmp/foo && head -$(grep -n "Ethernet adapter Local Area Connection" /tmp/foo | awk -F: '{ print $1 }') /tmp/foo | tail -$(($(wc -l /tmp/foo | awk '{ print $1 }') - $(grep -n "Ethernet adapter Local Area Connection" /tmp/foo | awk -F: '{ print $1 }'))) &> /tmp/bar && tail -$(($(wc -l /tmp/bar | awk '{ print $1 }') - $(grep -n "DNS Servers" /tmp/bar | awk -F: '{ print $1 }') + 1)) /tmp/bar | head -3 | awk '{ print "nameserver " $NF }' > /etc/resolv.conf && rm /tmp/foo && rm /tmp/bar
