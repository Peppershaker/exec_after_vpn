#!/bin/bash
log='/var/log/openvpn_script.log'
date >> $log
echo $1 >> $log
echo $2 >> $log
echo -e `curl -s curlmyip.net` >> $log
