# Architecture

## Current Azure dependencies

| Resource | Name | Resource group | Current state |
|---|---|---|---|
| AKS | `aks-batch818` | `Training-Batch-8.18` | Existing; OIDC issuer and workload identity enabled |
| ACR | `batch818acr` | `Training-Batch-8.18` | Existing Standard SKU; admin user and public access enabled |

The AKS managed node resource group is owned by AKS and must not be managed manually.

## Target design

New Northbridge platform resources will be created in `Moulaye-Haidara-8.18-RG`. Existing AKS and ACR are referenced as external dependencies until an explicit ownership decision is made.

```text
HTTPS ingress -> AKS API and worker -> private Storage and database
                              |-> Key Vault via workload identity
                              |-> Log Analytics
```

