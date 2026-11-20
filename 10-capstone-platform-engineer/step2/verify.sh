#!/bin/bash
set -euo pipefail
sleep 12
logs=$(kubectl logs -n acme-production -l app=order-service --tail=30 2>/dev/null || true)
echo "$logs" | grep -q 'order->payment OK'