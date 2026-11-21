`kubectl apply -f ~/assets/03/deployment.yaml`{{exec}}

`kubectl apply -f ~/assets/03/service.yaml`{{exec}}

`kubectl get svc,endpoints -n pratice-platform payment-api`{{exec}}