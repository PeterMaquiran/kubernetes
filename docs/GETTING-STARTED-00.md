# Start here: scenario 00 (beginner walkthrough)

Scenario **00** is only a **warm-up**: prove the cluster works and create one namespace. You do **not** clone Git on the lab machine.

---

## Part A — Open the lab in Killercoda (browser)

Do this on your **computer**, in **Chrome/Firefox/Safari** — not only in the terminal.

1. Log in at [killercoda.com](https://killercoda.com).
2. Go to your scenarios page (example):  
   **https://killercoda.com/petermaquiran/**
3. Find the course titled something like:  
   **ACME Corp — Kubernetes: Foundations → Pro**
4. Click the first scenario: **`00 — Course map`** (or **00 — Course map & kubectl cheat sheet**).
5. Wait **1–3 minutes**. Killercoda starts a small Kubernetes cluster for you.  
   When ready, you should see a **terminal** on the right and text on the **left**.

If you do not see any scenarios, the GitHub repo is not connected yet — see [KILLERCODA.md](KILLERCODA.md) section 2.

---

## Part B — What the screen means

```
┌─────────────────────────────┬──────────────────────────────┐
│  LEFT: instructions         │  RIGHT: terminal              │
│  (intro → steps)            │  root@controlplane:~$         │
│                             │  you type kubectl here        │
│  [ Start ]  [ Check ]       │                               │
└─────────────────────────────┴──────────────────────────────┘
```

- **Start** — leaves the intro and opens step 1.
- **Check** — Killercoda runs a script to see if you did the step correctly.
- Commands in the left panel may be **clickable** (Killercoda runs them in the terminal for you).

---

## Part C — Do scenario 00 step by step

### Step 0 — Intro page

1. Read the intro (ACME Corp story). Optional.
2. Click **Start** (bottom or top of the left panel).

### Step 1 — “Verify cluster access”

Run these **in the right-hand terminal** (or click each command on the left if it has a run button):

```bash
kubectl cluster-info
```

You should see a Kubernetes control plane URL (not an error).

```bash
kubectl get nodes -o wide
```

You should see one node named **controlplane** with **STATUS = Ready**.

```bash
kubectl create namespace pratice-platform
```

Creates the namespace used in later labs.

```bash
kubectl get ns pratice-platform
```

You should see **pratice-platform** in the list.

### Step 2 — Pass the step

1. Click **Check** on the left.
2. If it says **success** (or similar), click through to **Finish**.
3. Open scenario **01 — Cluster ops & labels** next.

If **Check** fails:

- Run `kubectl create namespace pratice-platform` again (safe if it already exists: use  
  `kubectl create namespace pratice-platform --dry-run=client -o yaml | kubectl apply -f -`).
- Make sure the node is **Ready**: `kubectl get nodes`.

---

## Part D — What you should **not** do on 00

| Do not | Why |
| --- | --- |
| `git clone git@github.com:...` on controlplane | No SSH key on the lab VM |
| Expect a `kubernetes` folder on the VM | Course files live on GitHub; Killercoda loads the scenario in the browser |
| Skip **Check** | Step 1 is only “done” when Check passes |

---

## Quick copy-paste (all of step 1)

```bash
kubectl cluster-info
kubectl get nodes -o wide
kubectl create namespace pratice-platform
kubectl get ns pratice-platform
```

Then click **Check**.

---

## Still stuck?

| Symptom | Fix |
| --- | --- |
| No scenarios on Killercoda | Connect repo `PeterMaquiran/kubernetes` in Creator settings |
| `kubectl: command not found` | Wait for the environment to finish loading; refresh the scenario page |
| Left panel empty | Hard refresh; confirm `00-course-map` exists in GitHub and is listed in `structure.json` |
| Using someone else’s course link | Use **your** Killercoda profile URL after **your** repo is connected |

More detail: [KILLERCODA.md](KILLERCODA.md)