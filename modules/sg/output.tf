output "security_id_nginxclient" {
  value = aws_security_group.for_nginx_client.id
}

output "security_id_nginxnodes" {
  value = aws_security_group.for_nginx_nodes.id
}
