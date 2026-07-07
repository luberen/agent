#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

podman run -d \
    --name searxng \
    --network agent-net \
    -p 8080:8080 \
    -v "$SCRIPT_DIR/settings.yml:/etc/searxng/settings.yml:Z" \
    docker.io/searxng/searxng:latest