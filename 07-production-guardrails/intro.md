# Ticket PLAT-880: Namespace hardening before multi-tenant go-live

Apply **ResourceQuota**, **LimitRange**, and **PDB** for `payment-api` (mirrors policy-as-code in prod).