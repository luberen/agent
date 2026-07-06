
# AI Development Stack - 4GB RAM Laptop

## Current Working Components
- **LiteLLM Proxy** → Routes to Mistral (free)
- **Continue.dev** in VS Code → Interactive coding assistant
- **Hermes Agent** → Installed (partial integration)

## Start the Stack
./start-stack.sh

## Usage
- Open VS Code in this folder → Use Continue sidebar (Mistral-LiteLLM)
- LiteLLM runs on http://localhost:8000
- Hermes: `hermes chat` (may need further config)

## Notes
- Only Mistral is configured for now.
- Keep LiteLLM running when using Continue.
- Monitor RAM with `htop`.
