#!/usr/bin/env bash

source "$(dirname "$0")/lib.sh"

echo
echo "=============================="
echo " AI Stack Health Check"
echo "=============================="
echo

load_env

check_file "$PROJECT_ROOT/config/litellm.yaml"
success "LiteLLM config found"

check_file "$PROJECT_ROOT/agent_dev/bin/activate"
success "Python virtual environment found"

check_command litellm
success "LiteLLM installed"

check_command hermes
success "Hermes installed"

check_command curl
success "curl installed"

if command -v podman >/dev/null 2>&1; then
    success "Podman installed"
else
    warning "Podman not installed (optional)"
fi

echo
success "Health check passed."