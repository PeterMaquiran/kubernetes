#!/bin/bash
set -euo pipefail
rev=$(kubectl rollout history deployment/payment-api -n acme-platform | tail -n1 | awk '{print $1}')
[[ "$rev" -ge 2 ]]
kubectl get deploy payment-api -n acme-platform -o jsonpath='{.status.readyReplicas}' | grep -q .