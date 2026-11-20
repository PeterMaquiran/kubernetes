`kubectl apply -f ~/assets/09/stack-broken.yaml`{{exec}}

`kubectl get endpoints payment-api -n acme-payments`{{exec}}

`kubectl get pods -n acme-payments -l app=payment-api`{{exec}}

**Hint:** Endpoints empty while pods are Running usually means **selector drift** after a label change.