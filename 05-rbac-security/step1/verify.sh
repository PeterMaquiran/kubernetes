#!/bin/bash
set -euo pipefail
kubectl get rolebinding ci-deployer -n pratice-platform >/dev/null
kubectl auth can-i create deployments --namespace=pratice-platform --as=system:serviceaccount:pratice-platform:ci-deployer | grep -q yes
kubectl auth can-i delete secrets --namespace=pratice-platform --as=system:serviceaccount:pratice-platform:ci-deployer | grep -q no