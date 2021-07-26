#!/usr/bin/make -f
include hooks/.env
# auto populate env vars from hooks/.env file
VARS:=$(shell sed -ne 's/ *\#.*$$//; /./ s/=.*$$// p' hooks/.env )
$(foreach v,$(VARS),$(eval $(shell echo export $(v)="$($(v))")))

VERSION := $(shell git describe --tags)

.PHONY: build
build:
				go build .

.PHONY: build-bin
build-bin:
				sh hooks/build-bin

.PHONY: release-binary
release-bin:
				make build-bin
				aws s3 sync ./bin/ s3://$(BUCKET_BINARIES)/go-http-proxy/$(VERSION) --delete --region $(BUCKET_BINARIES_AWS_REGION)
				aws s3 sync s3://$(BUCKET_BINARIES)/go-http-proxy/$(VERSION) s3://$(BUCKET_BINARIES)/bin/go-http-proxy/latest --delete --region $(BUCKET_BINARIES_AWS_REGION)