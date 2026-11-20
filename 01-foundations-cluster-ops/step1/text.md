Label the namespace:

`kubectl label namespace acme-platform cost-center=platform-eng environment=lab --overwrite`{{exec}}

Verify:

`kubectl get namespace acme-platform --show-labels`{{exec}}