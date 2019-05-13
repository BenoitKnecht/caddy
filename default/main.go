package main

import (
	"github.com/mholt/caddy/caddy/caddymain"

	_ "github.com/captncraig/caddy-realip"
	_ "github.com/miekg/caddy-prometheus"
	_ "github.com/pyed/ipfilter"
)

func main() {
	caddymain.EnableTelemetry = false
	caddymain.Run()
}
