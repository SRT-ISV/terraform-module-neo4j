# variable "client_id" {
#  type    = string
#  default = ""

# }
# variable "client_secret" {
#  type    = string
#  default = ""
# }

variable "project_serial_no" {
 type    = string
 default = "2"

}

variable "aura_project_id" {
 type    = string
 default = ""

}

variable "project_id" {
 type    = string
 default = ""

}

variable "name" {
 type    = string
 default = "MyFirstAuraInstance"

}

variable "client_id_secret_name" {
 type    = string
 default = ""
}

variable "client_secret_secret_name" {
 type    = string
 default = ""
}

variable "cloud_provider" {
 type    = string
 default = "gcp"
}

variable "region" {
 type    = string
 default = "europe-west2"
}

variable "memory" {
 type    = string
 default = "2GB"
}

variable "storage" {
 type    = string
 default = "4GB"
}

variable "instance_type" {
 type    = string
 default = "professional-db"
}