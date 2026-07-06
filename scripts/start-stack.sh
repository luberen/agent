#!/usr/bin/env bash

source "$(dirname "$0")/lib.sh"

echo
echo "=============================="
echo " Herman AI Development Stack"
echo "=============================="
echo

load_env

"$SCRIPT_DIR/healthcheck.sh"

echo

if check_port; then
    success "LiteLLM already running."
else
    info "Starting LiteLLM..."

    "$SCRIPT_DIR/start-litellm.sh" &
    PID=$!

    info "Waiting for LiteLLM..."

    for i in {1..20}; do
        sleep 1

        if check_port; then
            success "LiteLLM started."
            break
        fi

        if [[ $i -eq 20 ]]; then
            die "LiteLLM failed to start."
        fi
    done
fi

echo

"$SCRIPT_DIR/test-stack.sh"

echo
success "AI Stack is ready."
echo
echo "Continue.dev endpoint:"
echo "http://localhost:8000/v1"
echo