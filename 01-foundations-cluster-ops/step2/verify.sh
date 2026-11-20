#!/bin/bash
set -euo pipefail
kubectl get pod -n acme-platform -l app=edge-cache -o jsonpath='{.items[0].status.phase}' | grep -q Running