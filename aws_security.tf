resource "aws_security_group" "allow_ssh" {
name        = "allow_ssh_sg"
description = "Allow SSH inbound connections"
vpc_id      = aws_vpc.my_vpc.id
ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
ingress {
  description      = "http into VPC"
  from_port        = 80
  to_port          = 80
  protocol         = "tcp"
  cidr_blocks      = [0.0.0.0/24]
}
egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
tags = {
  Name = "allow_ssh_sg"
}
}
resource "aws_instance" "my_instance" {
ami                         = "ami-063d4ab14480ac177"
instance_type               = "t2.micro"
key_name                    = "terraform"
vpc_security_group_ids      = [aws_security_group.allow_ssh.id]
subnet_id                   = aws_subnet.public.id
associate_public_ip_address = true
tags = {
  Name = "My Instance"
}
}


provider "aws" {
 region = "eu-west-1"
}
 
resource "aws_instance" "my_instance1" {
 ami           = "ami-063d4ab14480ac177"
 instance_type = "t2.micro"
 key_name = "terraform"
 vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 subnet_id = aws_subnet.public.id
 associate_public_ip_address = true
 
tags = {
   Name ="My Instance1"
}
