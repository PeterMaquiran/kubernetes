#!/bin/bash
set -euo pipefail
kubectl get pods -n acme-payments -l app=payment-api --no-headers | grep -q Running
subsets=$(kubectl get endpoints payment-api -n acme-payments -o jsonpath='{.subsets}' 2>/dev/null || echo "")
[[ -z "$subsets" || "$subsets" == "null" || "$subsets" == "[]" ]]