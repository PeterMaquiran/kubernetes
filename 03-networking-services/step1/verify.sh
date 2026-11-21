#!/bin/bash
set -euo pipefail
kubectl get svc payment-api -n pratice-platform >/dev/null
addrs=$(kubectl get endpoints payment-api -n pratice-platform -o jsonpath='{.subsets[0].addresses}' 2>/dev/null || true)
[[ -n "$addrs" && "$addrs" != "null" ]]