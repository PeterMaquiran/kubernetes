#!/bin/bash
set -euo pipefail
kubectl get ns acme-production >/dev/null
ready=$(kubectl get deploy payment-api -n acme-production -o jsonpath='{.status.readyReplicas}' 2>/dev/null || echo 0)
[[ "${ready:-0}" -ge 2 ]]
kubectl auth can-i get configmaps --namespace=acme-production --as=system:serviceaccount:acme-production:runtime | grep -q yes