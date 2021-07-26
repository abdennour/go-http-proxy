# Go Http Proxy
This is a squid-like HTTP proxy based on [github@smartystreets/cproxy](https://github.com/smartystreets/cproxy).
This git repo is to use the Cproxy library and web app from it as binary artifact can be reused every, as such using any http proxy (Squid, .. so on)

# Prerequisites
- docker (v20 or above)
- docker-compose ( v1.29.x or above)

# Getting started

- Run the app `go run .`
- Validate it `curl -x localhost:8080 https://google.com` or using env var `HTTP_PROXY=http://localhost:8080` for other clients

or Run the app with custom port:
<details>
- Run the app with custom port `go run . --port=9191`
- Validate it `curl -x localhost:9191 https://google.com` or using env var `HTTP_PROXY=http://localhost:8080` for other clients
</details>


or Run it inside container:
<details>
- up it `docker-compose up -d`
- then validate `curl -x $(docker-compose port app 8080) https://google.com`
- clean up it `docker-compose down`
</details>

# License

MIT