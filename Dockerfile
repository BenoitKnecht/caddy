FROM golang:1.8 as build

COPY . /go/src/github.com/mholt/caddy/

WORKDIR /go/src/github.com/mholt/caddy/caddy

RUN go get ./...
RUN CGO_ENABLED=0 ./build.bash

FROM alpine:3.6

COPY --from=build /go/src/github.com/mholt/caddy/caddy/caddy /usr/local/bin/

ENTRYPOINT ["caddy"]
