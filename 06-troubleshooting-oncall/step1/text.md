Deploy the broken release (simulates prod state):

`kubectl apply -f ~/assets/06/broken-deployment.yaml`{{exec}}

Triage:

`kubectl get pods -n pratice-platform -l app=notification-worker`{{exec}}

`kubectl describe pod -n pratice-platform -l app=notification-worker | tail -30`{{exec}}

`kubectl logs -n pratice-platform -l app=notification-worker --previous 2>/dev/null || kubectl logs -n pratice-platform -l app=notification-worker`{{exec}}

Find the root cause: container **exits with code 1** after 5 seconds.