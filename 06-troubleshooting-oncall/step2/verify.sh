#!/bin/bash
set -euo pipefail
kubectl wait --for=condition=Ready pod -l app=notification-worker -n pratice-platform --timeout=120s