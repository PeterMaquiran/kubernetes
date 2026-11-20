`kubectl apply -f ~/assets/04/configmap.yaml`{{exec}}

`kubectl apply -f ~/assets/04/secret.yaml`{{exec}}

`kubectl apply -f ~/assets/04/deployment.yaml`{{exec}}

`kubectl logs -n acme-platform -l app=order-service --tail=5`{{exec}}