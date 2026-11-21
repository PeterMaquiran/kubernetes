Ensure namespace exists:

`kubectl create namespace pratice-platform --dry-run=client -o yaml | kubectl apply -f -`{{exec}}

`kubectl apply -f ~/assets/07/quota.yaml`{{exec}}

`kubectl apply -f ~/assets/07/limitrange.yaml`{{exec}}

`kubectl apply -f ~/assets/07/pdb.yaml`{{exec}}

`kubectl get quota,limitrange,pdb -n pratice-platform`{{exec}}