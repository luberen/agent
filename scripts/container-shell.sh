#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

if ! podman ps --format "{{.Names}}" | grep -qx "herman-dev"; then
    "$PROJECT_ROOT/container/run.sh"
fi

exec "$PROJECT_ROOT/container/exec.sh" "$@"