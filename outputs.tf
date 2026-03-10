output "connection_url" {
  value = module.neo4jaura.connection_url
}

output "username" {
  value = module.neo4jaura.username
}

output "password" {
  value     = module.neo4jaura.password
  sensitive = true
}
