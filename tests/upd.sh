#!/bin/bash

#ROUTE_TO_BIN=my-stm-32-projects/stm32-w5500/build/main.bin
ROUTE_TO_BIN=my-stm-32-projects/qwe-4/build/main.bin
timestamp=$(date +%Y%m%d%H%M%S)

scp ubuntu@192.168.0.20:$ROUTE_TO_BIN /root/archive/main-${timestamp}.bin
rm -f /root/stm32-w5500-rest-dev.bin
ln -s /root/archive/main-${timestamp}.bin /root/stm32-w5500-rest-dev.bin

echo "Try it (write):"
echo "st-flash write /root/stm32-w5500-rest-dev.bin 0x08000000"
echo "Checkup micro-controller:"
echo "$ st-info --probe"
echo "$ st-trace"
echo "Find new net device:"
echo "$ arp -a"
echo "$ nmap -sn 192.168.0.0/24"
echo "$ ping 192.168.0.22"