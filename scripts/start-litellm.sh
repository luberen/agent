#!/usr/bin/env bash

source "$(dirname "$0")/lib.sh"

load_env

check_file "$PROJECT_ROOT/config/litellm.yaml"
check_file "$PROJECT_ROOT/agent_dev/bin/activate"

source "$PROJECT_ROOT/agent_dev/bin/activate"

info "Starting LiteLLM..."

litellm \
    --config "$PROJECT_ROOT/config/litellm.yaml" \
    --port 8000