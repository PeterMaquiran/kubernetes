#!/bin/bash
set -euo pipefail
kubectl wait --for=condition=Ready pod -l app=session-cache -n pratice-platform --timeout=180s
nodes=$(kubectl get pods -n pratice-platform -l app=session-cache -o jsonpath='{range .items[*]}{.spec.nodeName}{"\n"}{end}' | sort -u | wc -l | tr -d ' ')
[[ "$nodes" -ge 2 ]]