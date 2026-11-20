#!/bin/bash
set -euo pipefail
kubectl get namespace acme-platform -o jsonpath='{.metadata.labels.cost-center}' | grep -q platform-eng
kubectl get namespace acme-platform -o jsonpath='{.metadata.labels.environment}' | grep -q lab