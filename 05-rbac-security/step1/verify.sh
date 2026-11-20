#!/bin/bash
set -euo pipefail
kubectl get rolebinding ci-deployer -n acme-platform >/dev/null
kubectl auth can-i create deployments --namespace=acme-platform --as=system:serviceaccount:acme-platform:ci-deployer | grep -q yes
kubectl auth can-i delete secrets --namespace=acme-platform --as=system:serviceaccount:acme-platform:ci-deployer | grep -q no