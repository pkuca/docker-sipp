# Docker container for SIPp

- Docker container for running [SIPp](http://sipp.sourceforge.net/index.html)
- Installs build-time latest version available in base image `alpine:3`
- [Github Repo](https://github.com/pkuca/docker-sipp)
- [Docker Hub](https://hub.docker.com/r/pkuca/sipp/)

## Getting Started

Pull the latest image using:
```
docker pull pkuca/sipp
docker run -it pkuca/sipp
```

or clone this repo and
```
docker build -t sipp
docker run -it sipp
```

## Usage

You can pass your SIPp arguments to the run command, example:
```
docker run \
    -it \
    pkuca/sipp \
    -sn uas
```

Use a custom `scenarios` directory by mounting it to `/sipp` in the container:
```
docker run \
    -v $PWD/scenarios:/sipp \
    -p 5060 \
    -it \
    pkuca/sipp \
    -sf opt1.xml \
    DEST_IP
```

Volume mounts can be used to:
- mount custom `scenarios` directories (target: `/sipp`)
- mount custom `pcap` directories (target: `/sipp/pcap`)
- extract logs
- etc

Start a container with an ephemeral external port allocated to the default SIPp port 5060:
```
docker run \
    -p 5060 \
    -it \
    pkuca/sipp \
    -sn uas

docker ps
5e8fecdede6c        pkuca/sipp          "sipp -sn uas"      14 seconds ago      Up 13 seconds       0.0.0.0:32771->5060/tcp   festive_moser
```

Note: If you want to use udp specify your port as `-p 5060/udp`

You can also map port 5060 externally to 5060 on your container using the same argument by declaring both ports:
```
docker run \
    -d \
    -p 5060:5060 \
    pkuca/sipp \
    -sn uas
```

To run SIPp in detached mode you can start SIPp using the `-d` argument.

SIPp stdout is available by running `docker logs`.
```
docker run \
    --name sipp-uas \
    -d \
    -p 5060 \
    pkuca/sipp \
    -sn uas

docker logs -f sipp-uas
```
