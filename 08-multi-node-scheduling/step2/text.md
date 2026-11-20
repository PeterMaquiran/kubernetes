`kubectl apply -f ~/assets/08/redis-cache.yaml`{{exec}}

`kubectl get pods -n acme-platform -l app=session-cache -o wide`{{exec}}

Both pods should land on **different NODE** values when anti-affinity succeeds.