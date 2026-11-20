#!/bin/bash
set -euo pipefail
kubectl get nodes | grep -q Ready
kubectl get namespace acme-platform >/dev/null 2>&1
echo "acme-platform namespace ready"