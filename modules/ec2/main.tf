resource "aws_instance" "nginx_client_bashton" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.AZ1
  subnet_id                   = var.subnet_id_public_1
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_id_nginxclient]
 # count                      = var.public_node_count
  tags                        = var.tags_ec2_pub
 
}

resource "aws_instance" "nginx_client" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.AZ1
  subnet_id                   = var.subnet_id_public_1
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_id_nginxclient]
  #count                      = var.public_node_count
  tags                        = var.tags_ec2_pub2
 
}
######################


resource "aws_instance" "nginx_client2" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  availability_zone           = var.AZ2
  subnet_id                   = var.subnet_id_public_2
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.security_id_nginxclient]
  #count                      = var.public_node_count
  tags                        = var.tags_ec2_pub3
 
}



#######


resource "aws_instance" "nginx_node" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.AZ1
  subnet_id              = var.subnet_id_private_1
  key_name               = var.key_name
  vpc_security_group_ids = [var.security_id_nginxnodes]
  count                  = var.node_count
  tags                   = var.tags_ec2_priv
}
