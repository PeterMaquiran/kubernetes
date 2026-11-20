`kubectl create namespace acme-platform --dry-run=client -o yaml | kubectl apply -f -`{{exec}}

`kubectl get nodes -o custom-columns=NAME:.metadata.name,ROLE:.metadata.labels.node-role\\.kubernetes\\.io/control-plane,TAINTS:.spec.taints`{{exec}}

You should see **two Ready nodes**.