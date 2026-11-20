Confirm CI can list pods but cannot delete namespaces:

`kubectl auth can-i list pods --namespace=acme-platform --as=system:serviceaccount:acme-platform:ci-deployer`{{exec}}

`kubectl auth can-i delete namespaces --as=system:serviceaccount:acme-platform:ci-deployer`{{exec}}

Second command must answer **no**.