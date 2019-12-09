FROM alpine:3
LABEL description="sipp on alpine" maintainer="patrickkuca@gmail.com"

RUN apk add --no-cache sipp

WORKDIR /sipp

ENTRYPOINT ["sipp"]
