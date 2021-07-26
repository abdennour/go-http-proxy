# syntax=docker/dockerfile:1.2
FROM golang:1.16-alpine as build
WORKDIR /go/src/app
COPY go.mod go.sum ./
RUN --mount=type=cache,target=/root/.cache/go-build go mod download
COPY main.go .
RUN --mount=type=cache,target=/root/.cache/go-build go build -o go-http-proxy

FROM alpine:3.14 as runtime
COPY --from=build /go/src/app/go-http-proxy /bin
ENTRYPOINT [ "/bin/go-http-proxy" ]
CMD [ "--port=8080" ]
