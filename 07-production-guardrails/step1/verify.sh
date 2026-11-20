#!/bin/bash
set -euo pipefail
kubectl get resourcequota acme-platform-quota -n acme-platform >/dev/null
kubectl get limitrange acme-platform-defaults -n acme-platform >/dev/null
kubectl get pdb payment-api-pdb -n acme-platform >/dev/null