#!/bin/sh

# network adapter
adapter='wlan0'
# ID card
ID='220203570'
# temp password in WUXI campus
password='123456'

echo "ping 114.114.114.114"
while true
do
    ping -c 1 114.114.114.114 > /dev/null 2>&1
    if [ $? -eq 0 ];then
        echo "network good"

    else
        IP=$(ifconfig $adapter|sed -rn 's#^.*dr:(.*)B.*$#\1#gp')

        url="http://10.9.10.100:801/eportal/?c=Portal&a=login&callback=dr1003&login_method=1&user_account=%2C0%2C$ID&user_password=$password&wlan_user_ip=$IP&wlan_user_ipv6=&wlan_user_mac=000000000000&wlan_ac_ip=10.1.1.1&wlan_ac_name=&jsVersion=3.3.2&v=6886"
        echo $url
        echo "start"
        login="curl $url"
        $login
        echo $login
        echo "complete, 5s to check"
        sleep 5

        echo "ping 114.114.114.114"
        ping -c 1 114.114.114.114 > /dev/null 2>&1
        if [ $? -eq 0 ];then
            echo "chong lang"
        else
            echo "gg"
        fi
    fi
    echo "THE END"
    sleep 10s
done