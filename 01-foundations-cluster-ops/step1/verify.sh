#!/bin/bash
set -euo pipefail
kubectl get namespace pratice-platform -o jsonpath='{.metadata.labels.cost-center}' | grep -q platform-eng
kubectl get namespace pratice-platform -o jsonpath='{.metadata.labels.environment}' | grep -q lab