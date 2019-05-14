FROM golang:1.12 as build

COPY  . /go/src/github.com/BenoitKnecht/caddy
WORKDIR /go/src/github.com/BenoitKnecht/caddy

ENV GO111MODULE=on 

RUN CGO_ENABLED=0 go build

FROM alpine:3.9

RUN apk --update add ca-certificates && rm -rf /var/cache/apk/*

COPY --from=build /go/src/github.com/BenoitKnecht/caddy/caddy /usr/local/bin/

VOLUME /srv/http
VOLUME /var/lib/caddy

WORKDIR /srv/http

ENV CADDYPATH=/var/lib/caddy

EXPOSE 80 443

ENTRYPOINT ["caddy"]
