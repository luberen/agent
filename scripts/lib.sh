#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LITELLM_PORT=8000
LITELLM_URL="http://localhost:${LITELLM_PORT}"
# ---------- Colors ----------

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() {
    echo -e "${BLUE}ℹ${NC} $*"
}

success() {
    echo -e "${GREEN}✓${NC} $*"
}

warning() {
    echo -e "${YELLOW}⚠${NC} $*"
}

error() {
    echo -e "${RED}✗${NC} $*"
}

die() {
    error "$*"
    exit 1
}

# ---------- Environment ----------

load_env() {

    [[ -f "$PROJECT_ROOT/.env" ]] || die ".env not found"

    set -a
    source "$PROJECT_ROOT/.env"
    set +a

    success ".env loaded"
}

# ---------- Checks ----------

check_file() {

    [[ -f "$1" ]] || die "Missing file: $1"
}

check_command() {

    command -v "$1" >/dev/null 2>&1 \
        || die "Missing command: $1"
}

check_port() {

    curl \
        -fs \
        -H "Authorization: Bearer $LITELLM_MASTER_KEY" \
        "$LITELLM_URL/models" \
        >/dev/null 2>&1
}