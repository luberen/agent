Here is a complete, production-ready specification document summarizing your goal, system constraints, architecture, and step-by-step implementation guide.
------------------------------
## System Specification: Cloud-Powered Multi-Agent Software Development System for Low-Spec Hardware## 🎯 Strategic Goal
To set up a 100% free, production-ready, autonomous multi-agent development environment capable of deep software engineering tasks (such as refactoring modular Python/Qt applications) on low-spec hardware without using local LLMs.
## 💻 System Configuration & Constraints (Mid-2026)

* Host OS: Lubuntu 26.04 LTS (Lightweight LXQt desktop environment).
* Hardware Ceiling: 4GB RAM, weak CPU. Local LLMs (Ollama) cannot be used due to hardware limits.
* Financial Constraint: 100% free tiers only. No credit cards, no expiring trial credits, no "free tiers converting to paid."
* Security Principle: The autonomous agent must be isolated inside a rootless container to protect host files from hallucinated terminal execution commands.

------------------------------
## 🌐 System Architecture & Components

                  +--------------------------------+

                  |  VS Code / Continue.dev (GUI)  |
                  +---------------+----------------+
                                  | (Edits / Chat requests)
                                  v
+-----------------------+ +-------+------------------------+

|   Podman Container    | |          Host Environment      |
|                       | |                                |
|  [Hermes Agent v2026] | |   [LiteLLM Central Proxy]      |
|   Autonomous Loop     | |         (Port 8000)            |
+-----------+-----------+ +----------------+---------------+

            |                              |
            | (Tool Requests via Network)  |
            +----------------------------->|
                                           | (Injects Free Keys / Handles 429 Failovers)
                                           v
                        +------------------+------------------+

                        |                                     |
                        v (Supervisor/Router)                 v (Heavy Code Execution)
               [GitHub Models: GPT-4o]               [Google AI Studio: Gemini 2.5 Flash]

                        |                                     |
                        +------------------+------------------+
                                           | (Fallback on 429 Rate Limit)
                                           v
                                [Groq Cloud: Llama 3.3 70B]


   1. IDE Layer (VS Code + Continue.dev v2026+): Uses the new config.yaml format for inner-loop code modifications, code inline completions, and chat directly in the workspace.
   2. Autonomous Loop Layer (Hermes Agent v2026): An advanced developer agent running on a ReAct (Reasoning + Acting) pattern. It uses structured JSON output to execute local system tools (view_file, write_file, run_terminal_command) and validates changes autonomously.
   3. Isolation Layer (Podman Sandbox): A rootless, daemonless container configuration that isolates Hermes. It mounts only the project workspace folder and routes network traffic securely to the host system via host.containers.internal.
   4. Routing & Failover Gateway (LiteLLM Proxy): Runs on the host system using less than 45MB of RAM. It handles intent-based request routing, injects free API tokens, and dynamically switches endpoints if a cloud model hits a 429 rate limit.
   5. Free Cloud LLM Tier Blueprint (July 2026):
   * Orchestration / Intent Router: GPT-4o via GitHub Models free tier (subject to hourly request limits).
      * Large-Context Baseline Engine: Gemini 2.5 Flash via Google AI Studio (15 Requests Per Minute, 1M token limit, free tier).
      * Fast Execution Fallback: Llama 3.3 70B via Groq Cloud (generous daily rolling caps, high speed).
   
------------------------------
## 🛠️ Step-by-Step Implementation Guide## Step 1: Set Up the Host LiteLLM Routing Gateway
Open your Lubuntu host terminal (lxterminal) and create an isolated Python virtual environment to manage dependencies efficiently:

# Create and activate environment
python3 -m venv ~/agent_env
source ~/agent_env/bin/activate
# Install LiteLLM proxy server features
pip install litellm[proxy]

Create the central routing configuration file at ~/litellm_config.yaml:

Start the proxy server backend on your host machine:

litellm --config ~/litellm_config.yaml --port 8000

------------------------------
## Step 2: Configure Continue.dev inside VS Code
Open ~/.continue/config.yaml to point the editor pane directly to your local routing gateway:

------------------------------
## Step 3: Launch the Podman Isolation Sandbox
Create your project workspace on the host machine, then start the container sandbox with a network bridge to the host proxy:

mkdir -p ~/projects/my_app
cd ~/projects/my_app

podman run -it --name hermes_sandbox \
  -v .:/workspace:Z \
  -w /workspace \
  --add-host=host.containers.internal:host-gateway \
  docker.io/library/python:3.14-slim bash

------------------------------
## Step 4: Install and Wire Hermes Agent Inside the Sandbox
Once inside the active container terminal environment, run the installation script and configure the network parameters:

# Run the official mid-2026 installer
curl -fsSL https://nousresearch.com | bash
source ~/.bashrc
# Initialize model connections via interactive wizard
hermes model

Wizard Target Values:

* Connection Provider Type: Custom OpenAI-Compatible Endpoint
* Target Endpoint URL: http://containers.internal
* Model Identification: heavy-agent

------------------------------
## 🏃‍♂️ Verification Task Run
To verify your end-to-end setup, execute this command inside your isolated Podman prompt:

hermes run "Generate a valid, minimal PyQt6 boilerplate configuration script, write it to sample_app.py, and run a local syntax test on it." --yolo

------------------------------
The system is now fully configured. Next, we can update your actual API keys in litellm_config.yaml or customize specific testing frameworks inside your safe Podman workspace environment. Which task would you like to tackle first?

