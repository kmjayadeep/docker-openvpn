#!/bin/bash
echo -e "Enter clientname" 
read client
echo "Revoking client certificate with name : $client.ovpn"
docker-compose run --rm openvpn ovpn_revokeclient $client remove
