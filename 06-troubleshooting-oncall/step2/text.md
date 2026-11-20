Apply the hotfix manifest:

`kubectl apply -f ~/assets/06/fixed-deployment.yaml`{{exec}}

`kubectl rollout status deployment/notification-worker -n acme-platform`{{exec}}

`kubectl get pods -n acme-platform -l app=notification-worker`{{exec}}