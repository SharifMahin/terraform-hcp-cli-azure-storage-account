# terraform-hcp-cli-azure-storage-account

A modular Terraform project demonstrating HCP Terraform CLI-driven workflow — deploys an Azure Resource Group and Storage Account with state managed remotely by HCP Terraform.

---

## 📋 Overview

This project demonstrates how to use HCP Terraform with a CLI-driven workflow. Unlike VCS workflow where GitHub push triggers a plan, CLI workflow allows you to run `terraform plan` and `terraform apply` locally while state is managed remotely by HCP Terraform.

---

## 🏗️ Architecture

```
Local CLI (terraform apply)
          ↓
HCP Terraform (Remote State + Run)
          ↓
    Resource Group
          ↓
Storage Account + Blob Container
```

---

## ✨ Features

- ✅ HCP Terraform CLI-driven workflow
- ✅ Remote state managed by HCP automatically
- ✅ Fully modular structure — each resource in its own reusable module
- ✅ Variables managed via HCP UI — no tfvars committed
- ✅ Input validation on key variables
- ✅ Private blob container — no public access

---

## 📁 Project Structure

```
terraform-hcp-cli-azure-storage-account/
├── provider.tf
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── resource-group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── storage-account/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

## 🧩 Modules

| Module | Resources |
|--------|----------|
| `resource-group` | `azurerm_resource_group` |
| `storage-account` | `azurerm_storage_account`, `azurerm_storage_container` |

---

## ✅ Prerequisites

- Terraform >= 1.3.0
- HCP Terraform account — [app.terraform.io](https://app.terraform.io)
- Azure Service Principal with Contributor role
- Azure CLI installed and logged in

---

## 🔧 HCP Terraform Setup

### 1. Create Workspace

```
app.terraform.io
    → New Workspace
        → CLI-driven workflow
            → Name: terraform-hcp-cli-azure-storage-account
```

### 2. Set Terraform Variables

```
Workspace → Variables → Add variable (Terraform variable)

resource_group_name  = "rg-<project>-<env>-<region>"
location             = "japaneast"
storage_account_name = "str<project><env><region>"
container_name       = "cnt-<project>-<env>-<region>"
tags                 = {
  environment = "<dev|prod>"
  project     = "<project-name>"
  owner       = "<your-name>"
}  ← HCL tick
```

### 3. Set Azure Credentials

```
Workspace → Variables → Add variable (Environment variable)

ARM_CLIENT_ID       = <service principal client id>
ARM_CLIENT_SECRET   = <service principal secret>    ← Sensitive ✅
ARM_SUBSCRIPTION_ID = <your subscription id>
ARM_TENANT_ID       = <your tenant id>
```

---

## 🚀 Usage

### ▶️ Deploy

```bash
# Login to HCP Terraform
terraform login

# Initialize
terraform init

# Plan
terraform plan

# Apply
terraform apply
```

### 🗑️ Destroy

```bash
terraform destroy
```

Or via HCP UI:
```
Workspace → Settings → Destruction and Deletion → Queue Destroy Plan
```

---

## 💡 Key Concepts

| Concept | Where |
|---------|-------|
| CLI-driven workflow | Local `terraform apply` → HCP runs remotely |
| Remote state | Managed by HCP automatically |
| Variables via HCP UI | No tfvars committed |
| Module output chaining | `module.resource_group.name → module.storage_account` |
| Input validation | `modules/*/variables.tf` |

---

## 🔄 CLI vs VCS Workflow

| | CLI Workflow | VCS Workflow |
|--|-------------|-------------|
| Trigger | `terraform apply` locally | GitHub push |
| State | HCP | HCP |
| Variables | HCP UI | HCP UI |
| Use case | Solo developer, testing | Team, CI/CD |

---

## 🛠️ Tech Stack

- Terraform ~> 1.3.0
- AzureRM Provider ~> 4.0
- HCP Terraform (CLI-driven)
- Azure (japaneast)
- Azure CLI

---

## 👤 Author

**MD SHARIF MULLA MAHIN**  
Lead Engineer  
Tokyo, Japan 🇯🇵
