#!/bin/bash
set -euo pipefail
kubectl wait --for=condition=Available deployment/order-service -n pratice-platform --timeout=120s
logs=$(kubectl logs -n pratice-platform -l app=order-service --tail=20 2>/dev/null || true)
echo "$logs" | grep -q LOG_LEVEL=info
echo "$logs" | grep -q DB_USER=order_svc