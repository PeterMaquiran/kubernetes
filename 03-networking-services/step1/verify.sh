#!/bin/bash
set -euo pipefail
kubectl get svc payment-api -n acme-platform >/dev/null
addrs=$(kubectl get endpoints payment-api -n acme-platform -o jsonpath='{.subsets[0].addresses}' 2>/dev/null || true)
[[ -n "$addrs" && "$addrs" != "null" ]]