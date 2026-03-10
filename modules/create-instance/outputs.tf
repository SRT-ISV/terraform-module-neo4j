output "connection_url" {
  value = neo4jaura_instance.this.connection_url
}

output "username" {
  value = neo4jaura_instance.this.username
}

output "password" {
  value     = neo4jaura_instance.this.password
  sensitive = true
}
