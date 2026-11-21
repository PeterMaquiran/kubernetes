# Clone, sync, and run on Killercoda

This course lives in GitHub:

| | |
| --- | --- |
| **SSH** | `git@github.com:PeterMaquiran/kubernetes.git` |
| **HTTPS** | `https://github.com/PeterMaquiran/kubernetes.git` |
| **Killercoda profile** (after setup) | `https://killercoda.com/petermaquiran/` |

Killercoda reads scenarios from the connected repo (`structure.json` + scenario folders). You practice in the browser; no local cluster required.

---

## 1. Clone the repository (local copy)

Use this to edit scenarios, push updates, or fork.

### Prerequisites

- Git installed
- GitHub SSH key added to your account ([GitHub SSH docs](https://docs.github.com/en/authentication/connecting-to-github-with-ssh))

### Clone

```bash
git clone git@github.com:PeterMaquiran/kubernetes.git
cd kubernetes
```

HTTPS (if you do not use SSH):

```bash
git clone https://github.com/PeterMaquiran/kubernetes.git
cd kubernetes
```

### Repo layout (what Killercoda uses)

```
kubernetes/
├── structure.json          # Course order (00 → 10)
├── 00-course-map/
│   ├── index.json          # Scenario config + backend image
│   ├── intro.md
│   └── step1/
├── 01-foundations-cluster-ops/
├── ...
└── 10-capstone-platform-engineer/
```

After you **push** to `main` (or your default branch), Killercoda syncs via webhook (usually within a minute).

---

## 2. Connect the repo to Killercoda (one-time)

You need a **Killercoda account** and **Creator** access to publish scenarios from your GitHub repo.

1. Sign in at [killercoda.com](https://killercoda.com/).
2. Open **[Creator documentation](https://killercoda.com/creators)** and follow **Connect your GitHub repository** (wording may vary: Profile → Settings → Creator / GitHub).
3. Authorize Killercoda on GitHub.
4. Select repository: **`PeterMaquiran/kubernetes`**.
5. Confirm the default branch (usually `main`).

Killercoda expects:

- `structure.json` at the **repository root**
- One folder per scenario, each with an `index.json`

If only listed paths in `structure.json` appear, that is correct — unlisted folders are ignored.

---

## 3. Run a scenario in the browser

1. Go to your creator page:  
   **`https://killercoda.com/petermaquiran/`**  
   (Replace with your Killercoda username if it differs.)
2. Open the course **ACME Corp — Kubernetes: Foundations → Pro**.
3. Start **`00 — Course map`**.
4. Click **Start** on the intro, then work through steps.
5. Run commands in the terminal on the right, or use **`{{exec}}`** clickable commands in the left panel.
6. Click **Check** when a step lists verification — the `verify.sh` script must exit successfully.

### Recommended order

`00` → `01` → … → `10` (see root `README.md` for the learning path table).

### Environment images

| Scenarios | Backend `imageid` | Notes |
| --- | --- | --- |
| `00`–`07`, `09`–`10` | `kubernetes-kubeadm-1node` | Single-node cluster; faster startup |
| `08-multi-node-scheduling` | `kubernetes-kubeadm-2nodes` | `controlplane` + `node01`; allow extra load time |

Pre-loaded manifests appear under `~/assets/<scenario>/` when `index.json` defines an `assets` block.

---

## 4. Update the course locally and republish

```bash
cd kubernetes
# edit files under 00-course-map/, etc.
git status
git add .
git commit -m "Update scenario text"
git push origin main
```

Refresh your Killercoda scenario page after sync completes. If changes do not appear, wait a few minutes or disconnect/reconnect the repo in Creator settings.

### Make verification scripts executable (if Check fails)

```bash
find . -name 'verify.sh' -exec chmod +x {} \;
git add .
git commit -m "chmod verify scripts"
git push
```

---

## 5. Troubleshooting

| Problem | What to try |
| --- | --- |
| Scenarios not listed | Ensure `structure.json` exists at repo root; each scenario path matches a folder name. |
| **Check** always fails | Run the step commands manually in the terminal; read `stepN/verify.sh` for expected state. |
| Namespace missing | Scenario `00` creates `pratice-platform`; run `00` first or `kubectl create namespace pratice-platform`. |
| Scenario `08` pods pending | Use the 2-node image only for `08`; confirm `kubectl get nodes` shows 2 Ready nodes. |
| Assets not found | Paths are `~/assets/02/`, etc., after the environment starts — not on your laptop. |
| Sync delay | Push to GitHub, then hard-refresh the Killercoda scenario URL. |

### Useful commands inside a lab

```bash
kubectl get nodes
kubectl get ns
kubectl get all -n pratice-platform
kubectl describe pod -n <namespace> <pod-name>
```

---

## 6. Practice without Killercoda (optional)

Clone the repo and apply manifests on any cluster (minikube, kind, cloud):

```bash
kubectl apply -f 10-capstone-platform-engineer/assets/ --dry-run=client
kubectl apply -k 10-capstone-platform-engineer/assets/
```

Verification scripts are written for Killercoda’s kubeadm images; on another cluster you judge success yourself.

---

## Quick reference links

- Repository: [github.com/PeterMaquiran/kubernetes](https://github.com/PeterMaquiran/kubernetes)
- Killercoda creators: [killercoda.com/creators](https://killercoda.com/creators)
- Example scenario format: [killercoda/scenario-examples](https://github.com/killercoda/scenario-examples)