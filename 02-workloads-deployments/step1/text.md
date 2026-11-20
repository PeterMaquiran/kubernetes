`kubectl apply -f ~/assets/02/deployment-v1.yaml`{{exec}}

`kubectl rollout status deployment/payment-api -n acme-platform`{{exec}}

`kubectl get deploy,rs,pods -n acme-platform -l app=payment-api`{{exec}}