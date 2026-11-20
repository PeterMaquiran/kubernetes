# Enterprise Kubernetes Playground (Killercoda)

Practice Kubernetes the way platform teams do in production: namespaced services, RBAC, rollouts, incidents, and multi-node scheduling. Built for [Killercoda](https://killercoda.com/creators) — sync this repo to your creator account and run scenarios in the browser.

## Quick start

1. Push this repository to GitHub (or GitLab).
2. In Killercoda: **Profile → Creator → Connect repository**.
3. Open your profile URL, e.g. `https://killercoda.com/<your-handle>/`.
4. Start with **00 — Course map**, then follow tracks **Foundations → Platform → Enterprise → Pro**.

## Learning path

| Track | Scenario | Skill focus |
| --- | --- | --- |
| Foundations | 01 Cluster & namespaces | `kubectl`, contexts, labels |
| Foundations | 02 Deployments & rollouts | ReplicaSets, rollouts, rollback |
| Platform | 03 Services & discovery | ClusterIP, selectors, endpoints |
| Platform | 04 ConfigMaps & Secrets | 12-factor config, env mounts |
| Enterprise | 05 RBAC & least privilege | Roles, RoleBindings, audit mindset |
| Enterprise | 06 Troubleshooting on-call | events, logs, debug containers |
| Enterprise | 07 Production guardrails | requests/limits, probes, PDB |
| Pro | 08 Multi-node scheduling | affinity, taints (2-node cluster) |
| Pro | 09 Incident response | fix a broken payment pipeline |
| Pro | 10 Capstone — Platform engineer | deploy ACME Corp stack end-to-end |

## Images used

- `kubernetes-kubeadm-1node` — most scenarios (faster cold start).
- `kubernetes-kubeadm-2nodes` — scenario **08** (worker node `node01`).

## Local practice (optional)

Manifests under each scenario’s `assets/` folder can be applied on any cluster:

```bash
kubectl apply -f enterprise-kubernetes-playground/09-incident-response/assets/
```

## Company fiction

You are a **Platform Engineer at ACME Corp**. Teams ship `payment-api`, `order-service`, and `notification-worker` into shared clusters governed by RBAC and guardrails. Scenarios mirror tickets you would see in a real SRE/platform backlog.