# Run the course on Windows (~20 GB disk)

Killercoda is optional. This guide targets **Windows 10/11** with a **small OS drive** (~20 GB free). You need **WSL2**, a **small cluster**, and **kubectl** — not a browser inside the VM.

---

## Will 20 GB be enough?

| Component | Rough size |
| --- | --- |
| WSL2 Ubuntu | ~1–3 GB |
| Docker engine (inside WSL) | ~2–4 GB |
| k3d / cluster images | ~1–2 GB |
| Git + `kubectl` | &lt; 200 MB |
| Your repo | &lt; 1 MB |

**Tight but workable** if you:

- Avoid **Docker Desktop** on `C:` (heavy). Use **Docker Engine inside WSL** or **Rancher Desktop** with a small disk limit.
- Put WSL’s virtual disk on a **larger drive** if `C:` is only 20 GB (see below).
- Run `docker system prune -af` when images pile up.

If `C:` is the **only** 20 GB total for the whole PC, prefer **WSL on D:**** or expand storage first.

---

## Recommended stack (lightweight)

**WSL2 + Ubuntu + Docker in WSL + [k3d](https://k3d.io/) (k3s in Docker)**

- Fast to install, low RAM, good enough for scenarios **00–07**, **09–10**.
- **Scenario 08** (two nodes): create a cluster with one agent (two nodes total).

---

## Step 1 — Enable WSL2 (PowerShell as Administrator)

```powershell
wsl --install -d Ubuntu
```

Reboot if prompted. Open **Ubuntu** from the Start menu and create your Linux user.

Update packages:

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git curl ca-certificates
```

---

## Step 2 — Install Docker **inside WSL** (not Desktop if space is tight)

```bash
# Official Docker CE on Ubuntu (inside WSL2)
sudo apt install -y docker.io
sudo usermod -aG docker $USER
```

Close and reopen Ubuntu, then:

```bash
docker info
```

If `docker` fails, start the daemon:

```bash
sudo service docker start
```

(Optional: enable `sudo service docker start` in `~/.bashrc`.)

**Docker Desktop alternative:** only if you already use it — Settings → Resources → limit disk image size (e.g. 8 GB).

---

## Step 3 — Install kubectl and k3d

```bash
# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# k3d
curl -s https://raw.githubusercontent.com/k3s-io/k3d/main/install.sh | bash

kubectl version --client
k3d version
```

---

## Step 4 — Create a cluster

**Single node (most scenarios):**

```bash
k3d cluster create acme --agents 0
kubectl get nodes
```

**Two nodes (scenario 08):**

```bash
k3d cluster delete acme 2>/dev/null || true
k3d cluster create acme --agents 1
kubectl get nodes   # expect 2 nodes
```

`kubectl` uses `~/.kube/config` automatically after k3d creates the cluster.

---

## Step 5 — Clone the course and run scenario 00

Inside **WSL Ubuntu**:

```bash
cd ~
git clone https://github.com/PeterMaquiran/kubernetes.git
cd kubernetes

kubectl create namespace pratice-platform
bash 00-course-map/step1/verify.sh
```

Continue each scenario: read `NN-name/stepN/text.md`, run commands, then:

```bash
bash NN-name/stepN/verify.sh
```

**Manifest paths** (no Killercoda `~/assets`):

```bash
kubectl apply -f 02-workloads-deployments/assets/deployment-v1.yaml
kubectl apply -k 10-capstone-platform-engineer/assets/
```

---

## Step 6 — Use Windows Terminal (optional)

Install [Windows Terminal](https://aka.ms/terminal) and open the **Ubuntu** tab. All `kubectl` commands run there — same as Killercoda’s `controlplane`, but on your PC.

You can also edit the repo in **VS Code**:

```powershell
code \\wsl$\Ubuntu\home\<your-user>\kubernetes
```

---

## Move WSL off a full 20 GB `C:` drive

In **PowerShell (Admin)**:

```powershell
wsl --shutdown
```

Export/import to another drive, or use [Microsoft’s guide](https://learn.microsoft.com/en-us/windows/wsl/disk-space) to expand/move the WSL VHD.

---

## k3s vs “real” kubeadm (Killercoda)

| Topic | Notes |
| --- | --- |
| Most labs | Work on k3d/k3s |
| `policy/v1` PDB, RBAC, Deployments | Supported |
| Scenario 08 anti-affinity | Needs 2 nodes — use `k3d ... --agents 1` |
| Exact Killercoda version (1.37 kubeadm) | Not required for learning |

---

## Free disk when cramped

```bash
docker system prune -af
k3d cluster delete acme
# remove unused WSL distros: wsl --list, wsl --unregister ...
```

---

## Quick reference

```bash
# daily
cd ~/kubernetes
kubectl get nodes
kubectl get ns

# reset cluster
k3d cluster delete acme
k3d cluster create acme --agents 0
kubectl create namespace pratice-platform
```

---

## What you do **not** need on Windows

- Browser on the cluster VM  
- SSH `git@github.com` on a sandbox (use **HTTPS** clone)  
- Opening `https://...killercoda.com:6443` in Chrome (unless you use remote Killercoda)  

Questions or a verify script fails on k3d — note the scenario number and error text.