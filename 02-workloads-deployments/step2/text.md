Roll out **v2** (image bump simulates new release):

`kubectl set image deployment/payment-api -n acme-platform api=nginx:1.25-alpine`{{exec}}

`kubectl rollout status deployment/payment-api -n acme-platform`{{exec}}

Something looks wrong in staging — **rollback** to the previous ReplicaSet:

`kubectl rollout undo deployment/payment-api -n acme-platform`{{exec}}

`kubectl rollout history deployment/payment-api -n acme-platform`{{exec}}