#!/bin/bash
echo -e "Enter clientname" 
read client
echo "Generating client certificate with name : $client.ovpn"
docker-compose run --rm openvpn easyrsa build-client-full $client
docker-compose run --rm openvpn ovpn_getclient $client > $client.ovpn
