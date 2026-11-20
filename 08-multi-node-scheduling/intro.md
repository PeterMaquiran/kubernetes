# Ticket CAP-12: Session cache must survive single node loss

This lab uses a **2-node** cluster (`controlplane`, `node01`). Spread `session-cache` replicas across hosts using **podAntiAffinity**.