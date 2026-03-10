# Neo4j Aura Instance Provisioning with Terraform

This Terraform module automates the deployment of **Neo4j Aura** database instances. It integrates with **Google Secret Manager** to securely retrieve API credentials and includes logic to dynamically select Aura Projects.

---

## 🏗 Architecture & Flow

The module operates in three distinct phases:
1.  **Secret Retrieval**: Uses the `google` provider to fetch `client_id` and `client_secret`.
2.  **Authentication**: Initializes the `neo4jaura` provider using the secrets from GCP.
3.  **Resource Creation**: Resolves the target Project ID and provisions the instance.



---

## 🔧 Variable Configuration

### Input Variables

The following variables are used to configure the instance and the connection to the Aura API.

| Name | Type | Default | Required | Description |
| :--- | :--- | :--- | :---: | :--- |
| `client_id_secret_name` | `string` | n/a | **Yes** | The name of the secret in Google Secret Manager for the Aura Client ID. |
| `client_secret_secret_name` | `string` | n/a | **Yes** | The name of the secret in Google Secret Manager for the Aura Client Secret. |
| `project_serial_no` | `string` | `"2"` | No | The index (0-based) of the project in your Aura account. |
| `aura_project_id` | `string` | `""` | No | Specific UUID of the Aura Project. Overrides serial number. |
| `project_id` | `string` | `""` | No | Direct Project ID override (Highest priority). |
| `name` | `string` | `"MyFirstAuraInstance"` | No | The display name of the Neo4j instance. |
| `cloud_provider` | `string` | `"gcp"` | No | The cloud provider (`gcp` or `aws`). |
| `region` | `string` | `"europe-west2"` | No | The cloud region for deployment. |
| `memory` | `string` | `"2GB"` | No | Allocated RAM (e.g., 2GB, 8GB). |
| `storage` | `string` | `"4GB"` | No | Allocated Storage (e.g., 4GB, 16GB). |
| `instance_type` | `string` | `"professional-db"` | No | The tier (e.g., `professional-db`, `enterprise-db`). |

### Output Variables

After a successful `terraform apply`, the following values are exported:

| Name | Description | Sensitive |
| :--- | :--- | :---: |
| `instance_id` | The unique UUID of the created Neo4j instance. | No |
| `connection_url` | The Bolt/Neo4j URL for database connection. | No |
| `username` | The default admin username (neo4j). | No |
| `password` | The auto-generated password for the instance. | **Yes** |

---

## 📂 Project Selection Logic

To prevent hardcoding IDs, this module resolves the `project_id` using a fallback hierarchy. The first non-empty value found is used:

1.  **Direct ID**: `var.project_id`
2.  **Aura ID**: `var.aura_project_id`
3.  **Dynamic Lookup**: `data.neo4jaura_projects.this.projects[tonumber(var.project_serial_no)].id`



---

## 🚀 Quick Start

1. **Prerequisites**: Ensure your Google Cloud CLI is authenticated and you have access to the Secret Manager.
2. **Initialize**:
   ```bash
   terraform init