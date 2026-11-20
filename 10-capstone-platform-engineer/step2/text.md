Wait for the order service to call payment-api successfully:

`kubectl wait --for=condition=Available deployment/order-service -n acme-production --timeout=120s`{{exec}}

`sleep 15`{{exec}}

`kubectl logs -n acme-production -l app=order-service --tail=5`{{exec}}

You should see lines containing **order->payment OK**.