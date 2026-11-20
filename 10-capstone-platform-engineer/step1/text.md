`kubectl apply -k ~/assets/10/`{{exec}}

`kubectl get all -n acme-production`{{exec}}

`kubectl auth can-i get configmaps --namespace=acme-production --as=system:serviceaccount:acme-production:runtime`{{exec}}