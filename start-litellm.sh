#!/bin/bash
# LiteLLM Starter - Run from project root

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$PROJECT_DIR"

# Load .env file
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
  echo "✅ Loaded .env file"
else
  echo "❌ .env file not found!"
  exit 1
fi

# Activate venv
source agent_dev/bin/activate

echo "🚀 Starting LiteLLM Proxy on port 8000..."
litellm --config litellm_config.yaml --port 8000