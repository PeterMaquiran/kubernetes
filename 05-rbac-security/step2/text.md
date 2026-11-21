Confirm CI can list pods but cannot delete namespaces:

`kubectl auth can-i list pods --namespace=pratice-platform --as=system:serviceaccount:pratice-platform:ci-deployer`{{exec}}

`kubectl auth can-i delete namespaces --as=system:serviceaccount:pratice-platform:ci-deployer`{{exec}}

Second command must answer **no**.