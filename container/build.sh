#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building herman-dev image..."

podman build \
    -t herman-dev \
    -f "$SCRIPT_DIR/Containerfile" \
    "$SCRIPT_DIR"

echo "Done."