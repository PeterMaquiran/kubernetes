Run a curl test pod:

`kubectl run net-check -n pratice-platform --image=curlimages/curl:8.5.0 --restart=Never --command -- sleep 3600`{{exec}}

Wait until Running, then:

`kubectl wait --for=condition=Ready pod/net-check -n pratice-platform --timeout=120s`{{exec}}

`kubectl exec -n pratice-platform net-check -- curl -s -o /dev/null -w "%{http_code}" http://payment-api.pratice-platform.svc`{{exec}}

Expected HTTP code: **200**