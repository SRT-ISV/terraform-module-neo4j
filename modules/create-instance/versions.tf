terraform {
  required_version = ">= 1.13.4"
  required_providers {
    neo4jaura = {
      source  = "neo4j-labs/neo4jaura"
      version = "0.0.2-beta"
     }
    google = {
      source  = "hashicorp/google"
      version = ">= 4.64, < 8"
     }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.64, < 8"
     } 
  }
}

provider "neo4jaura" {
  client_id     = data.google_secret_manager_secret_version.client_id.secret_data #var.client_id
  client_secret = data.google_secret_manager_secret_version.client_secret.secret_data #var.client_secret
}
