#!/bin/bash
set -euo pipefail
addrs=$(kubectl get endpoints payment-api -n acme-payments -o jsonpath='{.subsets[0].addresses[*].ip}' 2>/dev/null || true)
[[ -n "$addrs" ]]
code=$(kubectl run inc-verify-$RANDOM --rm -i --restart=Never -n acme-payments --image=curlimages/curl:8.5.0 --command -- curl -s -o /dev/null -w "%{http_code}" http://payment-api 2>/dev/null | tr -d '\r' || echo "000")
if [[ "$code" == "200" ]]; then
  exit 0
fi
if kubectl get pod incident-curl -n acme-payments >/dev/null 2>&1; then
  kubectl logs incident-curl -n acme-payments 2>/dev/null | grep -q 200
else
  exit 1
fi