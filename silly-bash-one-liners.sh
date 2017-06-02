#!/bin/bash

# Create /etc/resolve.conf in cygwin needed for dig/bind utils
ipconfig /all > /tmp/foo && head -$(grep -n "Ethernet adapter Local Area Connection" /tmp/foo | awk -F: '{ print $1 }') /tmp/foo | tail -$(($(wc -l /tmp/foo | awk '{ print $1 }') - $(grep -n "Ethernet adapter Local Area Connection" /tmp/foo | awk -F: '{ print $1 }'))) &> /tmp/bar && tail -$(($(wc -l /tmp/bar | awk '{ print $1 }') - $(grep -n "DNS Servers" /tmp/bar | awk -F: '{ print $1 }') + 1)) /tmp/bar | head -3 | awk '{ print "nameserver " $NF }' > /etc/resolv.conf && rm /tmp/foo && rm /tmp/bar


# Create a large text file, but unlike using truncate or dd if=/dev/(u)random of=blah the file contains only printible characters.
echo "all ur base r belong to us" >> blah && size=`ls -l blah | awk '{ print $5 }'` && while [ $size -lt 2621440000 ]; do cat blah >> blah && size=`ls -l blah | awk '{ print $5 }'`; done;
