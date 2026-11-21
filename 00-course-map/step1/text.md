Confirm you can reach the API server and see the control plane node.

`kubectl cluster-info`{{exec}}

`kubectl get nodes -o wide`{{exec}}

Create the practice namespace used across the course:

`kubectl create namespace pratice-platform`{{exec}}

`kubectl get ns pratice-platform`{{exec}}

When **Check** passes, continue to scenario **01 — Cluster & namespaces**.