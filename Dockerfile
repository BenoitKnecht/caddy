FROM golang:1.8 as build

COPY . /go/src/github.com/mholt/caddy/

WORKDIR /go/src/github.com/mholt/caddy/caddy

RUN go get ./...
RUN CGO_ENABLED=0 ./build.bash

FROM alpine:3.6

RUN apk --update add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=build /go/src/github.com/mholt/caddy/caddy/caddy /usr/local/bin/

VOLUME /srv/http
VOLUME /var/lib/caddy

WORKDIR /srv/http

ENV CADDYPATH=/var/lib/caddy

EXPOSE 80 443

ENTRYPOINT ["caddy"]
