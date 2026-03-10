# data "google_secret_manager_secret_version" "client_id" {
#   project = var.project_id
#   secret  = var.client_id_secret_name
#    version = "latest"           
# }

# data "google_secret_manager_secret_version" "client_secret" {
#   project = var.project_id
#   secret  = var.client_secret_secret_name
#    version = "latest"           
# }

module "neo4jaura" {
source = "./modules/create-instance"
project_id = var.project_id
name = var.name
client_id_secret_name = var.client_id_secret_name #data.google_secret_manager_secret_version.client_id.secret_data
client_secret_secret_name = var.client_secret_secret_name #data.google_secret_manager_secret_version.client_secret.secret_data
cloud_provider = var.cloud_provider
region = var.region
memory = var.memory
storage = var.storage
instance_type = var.instance_type
aura_project_id = var.aura_project_id
project_serial_no = var.project_serial_no
    
}