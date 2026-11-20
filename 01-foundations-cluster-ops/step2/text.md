Run an nginx pod with required app labels in `acme-platform`:

`kubectl run edge-cache -n acme-platform --image=nginx:1.25 --labels='app=edge-cache,tier=frontend,team=payments'`{{exec}}

`kubectl get pods -n acme-platform -l team=payments`{{exec}}