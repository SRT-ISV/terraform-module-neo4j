data "google_secret_manager_secret_version" "client_id" {
  project = var.project_id
  secret  = var.client_id_secret_name
   version = "latest"           
}

data "google_secret_manager_secret_version" "client_secret" {
  project = var.project_id
  secret  = var.client_secret_secret_name
   version = "latest"           
}

locals{
 
  get_project_id = data.neo4jaura_projects.this.projects[var.project_serial_no].id
  neo4j_aura_project_id = var.aura_project_id == "" ? local.get_project_id : var.aura_project_id

}

data "neo4jaura_projects" "this" {}

resource "neo4jaura_instance" "this" {
  name           = var.name
  cloud_provider = var.cloud_provider
  region         = var.region
  memory         = var.memory
  storage        = var.storage
  type           = var.instance_type
  project_id     = local.neo4j_aura_project_id
}





