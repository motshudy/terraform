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
}
