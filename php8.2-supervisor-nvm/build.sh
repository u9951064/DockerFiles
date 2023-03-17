#!/usr/bin/env bash

set -e

docker buildx create --use --name "php8.2-supervisor5.0-nvm0.39"
docker buildx build \
    --platform linux/amd64,linux/arm64,linux/arm/v6,linux/arm/v7 \
    -t joshtasi/php8.2_supervisor:1.0-nvm \
    -t joshtasi/php8_supervisor:php8.2-latest-nvm \
    -t joshtasi/php8_supervisor:php8.2-5.0-nvm \
    -t joshtasi/php8_supervisor:latest-nvm \
    -t joshtasi/php8.2-supervisor-nvm:latest \
    -t joshtasi/php8.2-supervisor-nvm:1.0 \
    --push .
docker buildx rm "php8.2-supervisor5.0-nvm0.39"