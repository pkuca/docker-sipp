FROM alpine:3
LABEL description="sipp on alpine" maintainer="patrickkuca@gmail.com"

RUN apk add --no-cache ca-certificates sipp

WORKDIR /sipp

EXPOSE 5060

ENTRYPOINT ["sipp"]
