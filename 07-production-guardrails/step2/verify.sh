#!/bin/bash
set -euo pipefail
kubectl wait --for=condition=Available deployment/payment-api -n pratice-platform --timeout=120s
ready=$(kubectl get deploy payment-api -n pratice-platform -o jsonpath='{.status.readyReplicas}')
[[ "${ready:-0}" -ge 1 ]]