output "server_ip" {
  description = "Public IP of the observability server"
  value       = hcloud_server.observability.ipv4_address
}

output "server_name" {
  description = "Name of the server"
  value       = hcloud_server.observability.name
}

output "ssh_command" {
  description = "SSH command to connect to server"
  value       = "ssh -i ~/.ssh/observability_key root@${hcloud_server.observability.ipv4_address}"
}
