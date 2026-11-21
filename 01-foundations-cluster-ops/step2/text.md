Run an nginx pod with required app labels in `pratice-platform`:

`kubectl run edge-cache -n pratice-platform --image=nginx:1.25 --labels='app=edge-cache,tier=frontend,team=payments'`{{exec}}

`kubectl get pods -n pratice-platform -l team=payments`{{exec}}