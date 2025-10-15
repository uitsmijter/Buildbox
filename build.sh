#!/usr/bin/env bash

docker build \
  -t ghcr.io/uitsmijter/buildbox \
  --build-arg VERSION=local \
  -f buildbox.dockerfile \
  .

docker build \
  -t ghcr.io/uitsmijter/e2e-runner \
  --build-arg VERSION=local \
  -f e2e.dockerfile \
  .
