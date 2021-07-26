package main

import (
	"flag"
	"log"
	"net/http"

	"github.com/smartystreets/cproxy/v2"
)

func main() {
	port := flag.String("port", "8080", "proxy port")
	flag.Parse()
	handler := cproxy.New()
	log.Printf("Listening on: *:%s", *port)
	_ = http.ListenAndServe(":"+*port, handler)
}
