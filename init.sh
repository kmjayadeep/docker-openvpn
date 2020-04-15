#!/bin/bash

if [ -z $1 ]; then
echo "Initialize openvpn container
    
Usage:
    $(basename "$0") [IP_ADDRESS]
    "
    exit 0
else
    echo "Setting up openvpn for $1"; fi

docker-compose run --rm openvpn ovpn_genconfig -u udp://$1
docker-compose run --rm openvpn ovpn_initpki
docker-compose up -d openvpn
