#!/usr/bin/env bash
#!/usr/bin/env bash

set -euo pipefail

if podman container exists herman-dev; then
    podman stop --ignore -t 3 herman-dev
else
    echo "Container not found."
fi