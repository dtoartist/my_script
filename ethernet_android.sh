# Android ethernet script
#!/bin/sh

IPADDRESS="192.168.xxx.xxx"
GWADDRESS="192.168.xxx.xxx"

ifconfig eth0 down
ifconfig eth0 hw ether D6:A4:A2:37:FD:D4
ifconfig eth0 $IPADDRESS netmask 255.255.255.0 up
sleep 7
ifconfig eth0 $IPADDRESS up
sleep 2
ifconfig eth0 $IPADDRESS up
sleep 1
# ~ android p
#busybox route add default gw $GWADDRESS eth0
# android 10 ~
ip route add default via $GWADDRESS dev eth0

setprop net.eth0.dns1 8.8.8.8
setprop net.eth0.dns2 8.8.4.4
ip rule add from all lookup main pref 99

# for ehternet adb
setprop service.adb.tcp.port 5555
stop adbd
sleep 2
start adbd

