#!/usr/bin/env bash

source "$(dirname "$0")/lib.sh"

echo
echo "=============================="
echo " AI Stack Smoke Test"
echo "=============================="
echo

load_env

info "Testing LiteLLM..."

if check_port; then
    success "LiteLLM is responding."
else
    die "LiteLLM is not responding."
fi

info "Testing Hermes..."

TMP=$(mktemp)

if hermes chat --query "Reply with only OK" >"$TMP" 2>&1; then
    if grep -qi "OK" "$TMP"; then
        success "Hermes test passed."
    else
        cat "$TMP"
        rm -f "$TMP"
        die "Hermes replied, but unexpected response."
    fi
else
    cat "$TMP"
    rm -f "$TMP"
    die "Hermes request failed."
fi

rm -f "$TMP"

echo
success "All smoke tests passed."