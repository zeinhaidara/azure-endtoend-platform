# Identity and Secrets

Workloads use AKS workload identity and least-privilege Azure role assignments. Secrets are stored in Key Vault and are never committed as Terraform variables, pipeline variables, or Kubernetes Secret manifests.

