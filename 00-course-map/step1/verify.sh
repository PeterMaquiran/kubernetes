#!/bin/bash
set -euo pipefail
kubectl get nodes | grep -q Ready
kubectl get namespace pratice-platform >/dev/null 2>&1
echo "pratice-platform namespace ready"