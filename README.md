# pkuca/sipp

- [Github](https://github.com/pkuca/docker-sipp)
- [Docker Hub](https://hub.docker.com/r/pkuca/sipp)

Run [SIPp](http://sipp.sourceforge.net/index.html) in a docker container.

The SIPp version used is whatever the latest version is in base image `alpine:3` at build-time.

## Usage
Defaults from [Dockerfile](Dockerfile):
```
WORKDIR /sipp
EXPOSE 5060
ENTRYPOINT ["sipp"]
```

Pass SIPp arguments to the run command:
```
docker run \
    -it \
    pkuca/sipp \
    -sn uas
```

Volume mounts can be used to:
- mount custom `scenarios` directories (target: `/sipp`)
- mount custom `pcap` directories (target: `/sipp/pcap`)
- extract logs
- etc.

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

To use UDP, specify the port like so: `-p 5060/udp`.

Map host port 5060 to container port 5060 using following syntax:
```
docker run \
    -d \
    -p 5060:5060 \
    pkuca/sipp \
    -sn uas
```

Run SIPp in detached mode using the `-d` argument.

SIPp stdout will be available by running `docker logs`:
```
docker run \
    --name sipp-uas \
    -d \
    -p 5060 \
    pkuca/sipp \
    -sn uas

docker logs -f sipp-uas
```

## Tags
- `latest` Base image `alpine:3`
