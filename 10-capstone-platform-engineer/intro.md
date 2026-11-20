# Capstone — Production release window

You are **release captain** for ACME’s payment vertical. Deliver:

- Namespace `acme-production` with baseline pod security label  
- Runtime RBAC for workloads  
- `payment-api` (2 replicas, probes) + `order-service` smoke caller  
- Kustomize apply (how many teams ship in GitOps)

Manifests: `~/assets/10/`