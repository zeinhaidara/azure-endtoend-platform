# Terraform Backend Bootstrap

The remote state backend was created manually on 2026-09-11 in subscription `606e824b-aaf7-4b4e-9057-b459f6a4436d`.

```text
Resource group:  Moulaye-Haidara-8.18-RG
Location:        canadacentral
Storage account: northbridgetfstatezein81
Container:       tfstate
SKU:             Standard_LRS
```

The storage account was created with HTTPS-only traffic, TLS 1.2, and public blob access disabled. Blob versioning and 30-day blob/container soft delete were enabled after creation.

Terraform will use separate state keys for each environment:

```text
northbridge/dev.tfstate
northbridge/prod.tfstate
```

The storage account must not be included in a Dev or Prod destroy operation.
