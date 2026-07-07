#!/usr/bin/env bash

set -euo pipefail

if podman container exists herman-dev; then

    if podman ps --format "{{.Names}}" | grep -qx herman-dev; then
        echo "Container already running."
    else
        echo "Starting existing container..."
        podman start herman-dev
    fi

    exit 0
fi

echo "Creating container..."

podman run \
    -dit \
    --name herman-dev \
    --userns=keep-id \
    --security-opt=no-new-privileges \
    --cap-drop=ALL \
    --network=bridge \
    -v "$PROJECT_ROOT:/workspace:Z" \
    -w /workspace \
    herman-dev

echo "Container started."