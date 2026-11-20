#!/bin/bash
set -euo pipefail
kubectl auth can-i list pods --namespace=acme-platform --as=system:serviceaccount:acme-platform:ci-deployer | grep -q yes
kubectl auth can-i delete namespaces --as=system:serviceaccount:acme-platform:ci-deployer | grep -q no