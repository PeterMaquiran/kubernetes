`kubectl apply -f ~/assets/05/sa.yaml`{{exec}}

`kubectl apply -f ~/assets/05/role.yaml`{{exec}}

`kubectl apply -f ~/assets/05/rolebinding.yaml`{{exec}}

`kubectl get sa,role,rolebinding -n pratice-platform | grep ci-deployer`{{exec}}