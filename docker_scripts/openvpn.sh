#!/bin/bash
# NordVPN user & pass
USER="INPUT_USERNAME"
PASSWORD="INPUT_PASS"

echo -e "$USER\n$PASSWORD" > /etc/openvpn/credentials

# Make scripts executable
chmod +x /etc/scripts/helper.sh

# Kill the last openvpn if it runs
if pgrep -x "openvpn" >/dev/null
then
  killall openvpn
fi

# get a random Canadian UDP config, you can change it to other contries
RANDOM_CONFIG=$(find /etc/openvpn/ovpn_udp -type f -iname 'ca*' | shuf -n 1)

# add our part to that config
sed -re 's@auth-user-pass$@auth-user-pass /etc/openvpn/credentials\nscript-security 3\nup /etc/openvpn/update-resolv-conf\ndown /etc/openvpn/update-resolv-conf\nipchange /etc/scripts/helper.sh@g' ${RANDOM_CONFIG} > /etc/openvpn/ovpn.conf

openvpn --config /etc/openvpn/ovpn.conf --daemon
