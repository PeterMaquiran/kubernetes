#!/bin/bash
set -euo pipefail
count=$(kubectl get nodes --no-headers 2>/dev/null | grep -c Ready || true)
[[ "$count" -ge 2 ]]