package main

import (
	"github.com/caddyserver/caddy/caddy/caddymain"

	_ "github.com/captncraig/caddy-realip"
	_ "github.com/miekg/caddy-prometheus"
	_ "github.com/pyed/ipfilter"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
