#!/bin/bash
set -euo pipefail
kubectl auth can-i list pods --namespace=pratice-platform --as=system:serviceaccount:pratice-platform:ci-deployer | grep -q yes
kubectl auth can-i delete namespaces --as=system:serviceaccount:pratice-platform:ci-deployer | grep -q no