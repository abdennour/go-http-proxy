# Go Http Proxy
This is a squid-like HTTP proxy based on [github@smartystreets/cproxy](https://github.com/smartystreets/cproxy).
This git repo is to use the Cproxy library and web app from it as binary artifact can be reused every, as such using any http proxy (Squid, .. so on)

# Prerequisites
- docker (v20 or above)
- docker-compose ( v1.29.x or above)

# How to use it

**Download it** check release page https://github.com/abdennour/go-http-proxy/releases/tag/v1.0.0

**Install it in Linux**

```sh
curl -LO https://github.com/abdennour/go-http-proxy/releases/download/v1.0.0/go-http-proxy-linux-amd64 \
 chmod +x go-http-proxy-* && sudo mv go-http-proxy-* /usr/local/bin/go-http-proxy
```

**Install it in MacOS**

```sh
curl -LO https://github.com/abdennour/go-http-proxy/releases/download/v1.0.0/go-http-proxy-darwin-amd64 \
 chmod +x go-http-proxy-* && sudo mv go-http-proxy-* /usr/local/bin/go-http-proxy
```

**Install it in Windows**

Download this executable file: https://github.com/abdennour/go-http-proxy/releases/download/v1.0.0/go-http-proxy-windows-amd64.exe


**Run it **

```sh
go-http-proxy
```

And now the the proxy should be listening on localhost:8080

**Run it with custom port**

```sh
go-http-proxy --port 9090
```

And now the the proxy should be listening on localhost:9090


# Contributing

- Run the app `go run .`
- Validate it `curl -x localhost:8080 https://google.com` or using env var `HTTP_PROXY=http://localhost:8080` for other clients

or Run the app with custom port:
<details>
- Run the app with custom port `go run . --port=9191`
- Validate it `curl -x localhost:9191 https://google.com` or using env var `HTTP_PROXY=http://localhost:9191` for other clients
</details>


or Run it inside container:
<details>
- up it `docker-compose up -d`
- then validate `curl -x $(docker-compose port app 8080) https://google.com`
- clean up it `docker-compose down`
</details>

# License

MIT
