#!/bin/bash
set -euo pipefail
replicas=$(kubectl get deploy payment-api -n acme-platform -o jsonpath='{.status.readyReplicas}')
[[ "${replicas:-0}" -ge 2 ]]