#!/bin/bash
set -euo pipefail
kubectl wait --for=condition=Ready pod/net-check -n pratice-platform --timeout=60s 2>/dev/null || true
code=$(kubectl exec -n pratice-platform net-check -- curl -s -o /dev/null -w "%{http_code}" http://payment-api 2>/dev/null || echo "000")
[[ "$code" == "200" ]]