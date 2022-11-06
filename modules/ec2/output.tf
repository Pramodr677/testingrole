output "Intance_public_ip" {
  value = aws_instance.nginx_client_bashton.public_ip
}

# output "Instance_ips" {
#   value = "${formatlist("%v", aws_instance.db_node.*.private_ip)}"
# }


output "Intance_public_ip2" {
  value = aws_instance.nginx_client.public_ip
}

output "Instance_ips" {
  value = "${formatlist("%v", aws_instance.nginx_node.*.private_ip)}"
}