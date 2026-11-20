# Ticket SEC-402: CI must not be cluster-admin

GitHub Actions deploys to `acme-platform` only. Grant **deployments** write, deny secrets delete cluster-wide.