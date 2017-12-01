#!/bin/bash

docker kill gfbuild
docker rm gfbuild

#docker build --tag "grafana/buildcontainer" docker/buildcontainer

docker run -i -t --rm \
  -v $GOPATH/src/github.com/grafana/grafana:/go/src/github.com/grafana/grafana \
  golang:1.9.2 /bin/sh -c "cd /go/src/github.com/grafana/grafana; go run build.go setup && go run build.go build"
