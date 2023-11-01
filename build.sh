#!/usr/bin/env bash

docker build \
  -t ghcr.io/uitsmijter/buildbox \
  -f buildbox.dockerfile \
  .

docker build \
  -t ghcr.io/uitsmijter/e2e-runner \
  -f e2e.dockerfile \
  .
