Fix the Service selector (manifest provided — patch in place):

`kubectl apply -f ~/assets/09/stack-fixed.yaml`{{exec}}

`kubectl get endpoints payment-api -n acme-payments`{{exec}}

Smoke test from a one-shot curl pod:

`kubectl run incident-curl -n acme-payments --image=curlimages/curl:8.5.0 --restart=Never -- curl -s -o /dev/null -w "%{http_code}\n" http://payment-api`{{exec}}

`kubectl wait --for=condition=Ready pod/incident-curl -n acme-payments --timeout=60s 2>/dev/null || true`{{exec}}

`kubectl logs incident-curl -n acme-payments`{{exec}}

Expected: **200**