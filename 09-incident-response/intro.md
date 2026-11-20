# SEV-2 — Checkout error rate 85%

**Incident commander:** You  
**Blast radius:** `acme-payments` namespace  
**Hypothesis:** Routing layer not reaching healthy backends  

Deploy the incident bundle and restore `/checkout` path (simulated with in-cluster curl).