#!/bin/bash
set -euo pipefail
phase=$(kubectl get pods -n pratice-platform -l app=notification-worker -o jsonpath='{.items[0].status.containerStatuses[0].state.waiting.reason}' 2>/dev/null || echo "")
[[ "$phase" == "CrashLoopBackOff" ]] || kubectl get pods -n pratice-platform -l app=notification-worker | grep -qE 'CrashLoop|Error'