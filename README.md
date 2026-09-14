# Northbridge Health Referral Platform

Infrastructure and delivery blueprint for replacing email and spreadsheet-based patient referral handling with a secure, reproducible Azure platform.

The application is intentionally small. The assessment focuses on secure Azure architecture, infrastructure as code, CI/CD, Kubernetes operations, observability, resilience, drift handling, rebuildability, and cost discipline.

## Repository structure

```text
.
├── README.md
├── .gitignore
├── infra/
│   ├── bootstrap/                 # One-time remote Terraform state bootstrap
│   ├── environments/
│   │   ├── dev/                   # Root configuration; dev inputs only
│   │   └── prod/                  # Root configuration; prod inputs only
│   └── modules/
│       ├── networking/            # VNet, subnets, private DNS and endpoints
│       ├── observability/         # Log Analytics and diagnostic settings
│       ├── data/                  # Storage, blob container and relational DB
│       ├── key-vault/             # Key Vault and access model
│       ├── acr/                   # Azure Container Registry
│       ├── aks/                   # Cluster, node pools and identities
│       └── workload-identity/     # Federated credentials and role assignments
├── app/
│   ├── api/                       # Referral API
│   ├── worker/                    # Referral processing worker
│   ├── Dockerfile.api
│   └── Dockerfile.worker
├── deploy/
│   └── helm/referrals/
│       ├── Chart.yaml
│       ├── templates/             # Deployments, services, ingress, policies
│       ├── values.yaml             # Shared safe defaults
│       ├── values-dev.yaml
│       └── values-prod.yaml
├── pipelines/
│   ├── terraform-pr.yml           # fmt, validate, scan, plan and plan artifact
│   ├── terraform-apply.yml        # Approved apply from main
│   ├── terraform-drift.yml        # Scheduled read-only drift plan
│   └── app.yml                     # Build once, scan, deploy dev, promote prod
├── scripts/
│   ├── load-test.*                 # HPA test and evidence collection
│   ├── resilience-test.*           # Pod deletion and broken-image rollback
│   └── verify-network-policy.*     # Prove denied traffic fails
└── docs/
    ├── architecture.md
    ├── bootstrap.md
    ├── identity-and-secrets.md
    ├── operations-runbook.md
    ├── drift-management.md
    ├── resilience-test-results.md
    ├── rebuild-test-results.md
    └── cost-review.md
```

Keep environment differences in Terraform variable files, backend configuration, Helm values, and pipeline parameters. Do not copy modules or manifests between environments.

## Delivery stages

1. **Architecture and design** — Define dev/prod topology, one-region VNet and subnets, AKS, ACR, Storage, database, Key Vault, Log Analytics, private endpoints/DNS, identity/RBAC, and cost-conscious SKUs.
2. **Terraform foundation** — Bootstrap the remote state backend manually, document it, then build reusable modules for networking, data, registry, AKS, identities, federated credentials, role assignments, and diagnostics.
3. **Infrastructure CI/CD** — On pull requests run formatting, validation, security/policy scans, and publish a readable plan. Apply from main only after human approval. Run a scheduled drift-detection plan.
4. **Application containerization** — Build API and worker with multi-stage Dockerfiles, non-root runtimes, no build toolchain in final images, vulnerability scanning, and immutable commit-traceable tags. Fail on high-severity findings.
5. **Application deployment pipeline** — Build each image once, push to ACR, deploy that exact artifact to dev automatically, and promote the same digest to prod after approval.
6. **Kubernetes platform configuration** — Package API and worker with Helm, use multiple replicas, probes, justified resources, TLS ingress, ConfigMaps for non-secrets, and Key Vault workload identity for secrets. Never commit plaintext Kubernetes secrets.
7. **Kubernetes resilience and security** — Add API HPA, load-test it, add a PodDisruptionBudget, enforce NetworkPolicy, prove denied traffic fails, and document that Kubernetes Secret encoding is not encryption.
8. **Observability** — Send AKS and application telemetry to Log Analytics, build one useful dashboard, create a referral-queue-aging alert, deliberately trigger it, and capture evidence that it fired.
9. **Drift and governance** — Make an intentional portal change, show the scheduled plan detecting it, and document reconciliation, review, and commit/approver traceability.
10. **Runbook** — Maintain a one-page operations guide covering purpose, repository, deployment, rollback, and the three most likely failures with symptoms and troubleshooting paths.
11. **Resilience testing** — Delete a pod under traffic, deploy a broken image, demonstrate rollout protection and rollback, and drive load until HPA scales out and settles.
12. **Full rebuild test** — Destroy dev and rebuild it through pipelines only. The documented backend bootstrap is the sole manual exception. End with the application serving traffic again.
13. **Cost review** — Use one region, the smallest practical node pool, and the cheapest valid tiers. Record control gaps caused by low-cost tiers and the production upgrade path.

## Required security principles

- No data service is reachable from the public internet.
- Private endpoints and private DNS are configured and tested, including name resolution from AKS.
- Workloads use managed identity/workload identity and least-privilege role assignments.
- Credentials never live in source control or plaintext pipeline variables.
- Every infrastructure and application deployment is traceable to a commit and approver.
- Terraform state is remote, locked, and treated as sensitive.

## Working agreement

Leave evidence in `docs/` for plans, scans, alerts, load tests, denied network traffic, rollback, drift detection, rebuild, and cost decisions. Replace placeholders with actual resource names, pipeline links, commit IDs, approvers, timestamps, and screenshots or command output as each stage is completed.
