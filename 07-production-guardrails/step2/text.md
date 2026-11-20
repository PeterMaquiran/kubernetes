Deploy payment-api with explicit requests (required by quota):

`kubectl apply -f ~/assets/07/deployment.yaml`{{exec}}

`kubectl get deploy payment-api -n acme-platform`{{exec}}

`kubectl describe quota acme-platform-quota -n acme-platform`{{exec}}