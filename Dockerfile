FROM alpine:3

RUN apk add --no-cache sipp

WORKDIR /sipp

ENTRYPOINT ["sipp"]
