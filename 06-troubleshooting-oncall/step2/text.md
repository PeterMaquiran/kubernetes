Apply the hotfix manifest:

`kubectl apply -f ~/assets/06/fixed-deployment.yaml`{{exec}}

`kubectl rollout status deployment/notification-worker -n pratice-platform`{{exec}}

`kubectl get pods -n pratice-platform -l app=notification-worker`{{exec}}