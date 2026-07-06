# AI Development Stack Architecture

## Goals

- Completely free AI-assisted development
- Low RAM footprint (4 GB Lubuntu)
- Modular components
- Security through sandboxing
- Replaceable AI providers

## Components

VS Code
Continue.dev
LiteLLM
Hermes Agent
Mistral API
Podman

## Data Flow

Developer
        │
        ▼
VS Code + Continue
        │
        ▼
LiteLLM
        │
        ▼
Mistral API

Hermes
        │
        ▼
LiteLLM
        │
        ▼
Mistral API

Hermes
        │
        ▼
Podman DevBox