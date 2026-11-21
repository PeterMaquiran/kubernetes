Label the namespace:

`kubectl label namespace pratice-platform cost-center=platform-eng environment=lab --overwrite`{{exec}}

Verify:

`kubectl get namespace pratice-platform --show-labels`{{exec}}