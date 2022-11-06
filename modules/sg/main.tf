resource "aws_security_group" "for_nginx_client" {
  name        = "nginx-sg"
  description = "sg for nginx client"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "SG-bastion"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "nginx-sg"
  }
}

resource "aws_security_group" "for_nginx_nodes" {
  name        = "nginx-sg-nodes"
  description = "sg for nginx nodes"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = [22, 80, 443]
    iterator = port
    content {
      description = "SG-nodes"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "nginx-sg"
  }
}