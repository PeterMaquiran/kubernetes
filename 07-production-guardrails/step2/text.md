Deploy payment-api with explicit requests (required by quota):

`kubectl apply -f ~/assets/07/deployment.yaml`{{exec}}

`kubectl get deploy payment-api -n pratice-platform`{{exec}}

`kubectl describe quota pratice-platform-quota -n pratice-platform`{{exec}}