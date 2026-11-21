#!/bin/bash
set -euo pipefail
kubectl get resourcequota pratice-platform-quota -n pratice-platform >/dev/null
kubectl get limitrange pratice-platform-defaults -n pratice-platform >/dev/null
kubectl get pdb payment-api-pdb -n pratice-platform >/dev/null