# Running OpenVPN server in docker container

Setup OpenVPN server on your cloud/private server under 2 minutes using docker. You can find the original Dockerfile and related documentation in [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn). This repo contains scripts to make the setup easy and instructions to use them.

## Prerequisites

- [docker](https://docs.docker.com/install/)
- [docker-compose](https://docs.docker.com/compose/install/)

## Setting up OpenVPN

Clone the repo
```bash
git clone https://github.com/kmjayadeep/docker-openvpn.git && cd docker-openvpn
```

#### Setting up OpenVPN and starting container 

```bash
./init.sh
```

Enter your desired password when prompted. You'll need this password when generating client certificates.

#### Destroying container
If something goes wrong and you want to destroy the setup to redo it again, use the following command

```bash
./destroy.sh
```

Enter `y` when asked for confirmation

## Generating and revoking certificates
A client certificate should be generated for each user who wish to connect to this server. To generate a client certificate, use the following command

```bash
./generate.sh
```

Follow the instructions. Enter the name of client who you want to generate certificate for. Enter the password you have provided in the setup phase if asked. You may be prompted to enter a client password as well. This password is used when connecting to server. 

If you wish to avoid using a password for client, use the following script instead.

```bash
./generate_nopass.sh
```

To revoke a client certificate, use the following script and enter the name of the client. Once revoked, the client will no longer be able to connect to your server

```bash
./revoke.sh
```

## Final notes

If you want to see the logs of the container, use the command `./logs.sh`

This setup has been tested with Digital Ocean 5$ cloud which has 1GB ram and 20GB space.