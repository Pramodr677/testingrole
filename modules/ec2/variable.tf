variable "subnet_id_public_1" {
  default = {}
}

variable "subnet_id_private_1" {
  default = {}
}

variable "security_id_nginxclient" {
  default = {}
}

variable "security_id_nginxnodes" {
  default = {}
}

variable "AZ1" {
  default = "us-west-2a"
}

variable "ami" {
  default = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "mumbai"
}

variable "tags_ec2_pub" {
  default = {}
}

variable "tags_ec2_pub2" {
  default = {}
}


variable "tags_ec2_priv" {
  default = {}
}

variable "node_count" {
  default = 2
}

