terraform {
  required_version = ">= 1.5.7"
  required_providers {
    neo4jaura = {
      source  = "neo4j-labs/neo4jaura"
      version = "0.0.2-beta"
     }
    google = {
      source  = "hashicorp/google"
      version = ">= 5.41, < 8"
     }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 5.41, < 8"
     } 
  }
}

# provider "neo4jaura" {
#   client_id     = data.google_secret_manager_secret_version.client_id.secret_data
#   client_secret = data.google_secret_manager_secret_version.client_secret.secret_data 
# }
