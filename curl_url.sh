#!/bin/sh
var1='curl "http://10.9.10.100:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=%2C0%2C'
ID=XXXXXXXXX
var3="&user_password=123456&wlan_user_ip="
IP=$(ifconfig wlan0|sed -rn 's#^.*dr:(.*)B.*$#\1#gp')
var5='&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=10.1.1.1&wlan_ac_name=&jsVersion=3.3.2&v=6886"'
var6=${var1}${ID}${var3}${IP}${var5}
$var6