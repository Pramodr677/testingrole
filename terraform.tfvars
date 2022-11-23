region           = "us-west-1"
vpc_cidr         = "10.0.0.0/16"
instance_tenancy = "default"
tags_vpc = {
  Name  = "nginx_vpc"
  Type  = "webserver"
  Owner = "pramod"
}
tags_igw = {
  Name  = "nginx_igw"
  Type  = "webserver"
  Owner = "pramod"
}
subnet_cidr_1 = "10.0.0.0/18"
subnet_cidr_2 = "10.0.64.0/18"
subnet_cidr_3 = "10.0.128.0/18"
subnet_cidr_4 = "10.0.192.0/18"
AZ1           = "us-east-1a"
AZ2           = "us-east-1b"
tags_subnet_pub = {
  Name  = "nginx_subnet_pub"
  Type  = "webserver"
  Owner = "pramod"
}
tags_subnet_priv = {
  Name  = "nginx_subnet-priv"
  Type  = "webserver"
  Owner = "pramod"
}
tags_nat = {
  Name  = "nginx_nat"
  Type  = "webserver"
  Owner = "pramod"
}
tags_public_route = {
  Name  = "nginx_public_RT"
  Type  = "webserver"
  Owner = "pramod"
}
tags_private_route = {
  Name  = "nginx_private_RT"
  Type  = "webserver"
  Owner = "pramod"
}
ami = "ami-08c40ec9ead489470"
instance_type = "t2.medium"
key_name = "mumbai"
node_count = 2
tags_ec2_pub = {
  Name  = "nginx-bastion"
  Type  = "webserver"
  Owner = "pramod"
  Category = "bastion"
}

tags_ec2_pub2 = {
  Name  = "nginx-public"
  Type  = "webserver"
  Owner = "pramod"
  Category = "public"
}
##
tags_ec2_pub3 = {
  Name  = "nginx-publicpassive"
  Type  = "webserver"
  Owner = "pramod"
  Category = "public"
}

tags_ec2_priv = {
  Name  = "nginx-nodes"
  Type  = "webserver"
  Owner = "pramod"
  Category = "Nodes"
}
