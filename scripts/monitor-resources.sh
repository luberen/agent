#!/bin/bash
echo "=== AI Stack Resource Monitor (4GB RAM System) ==="
echo "Time: $(date)"
echo "--------------------------------"

echo "Memory Usage:"
free -h

echo -e "\nTop Processes:"
ps aux --sort=-%mem | head -n 12

echo -e "\nLiteLLM / Hermes / Podman:"
pgrep -f "litellm|hermes|podman" | xargs -r ps -p 2>/dev/null || echo "None running"

echo -e "\nSwap Usage:"
swapon --show