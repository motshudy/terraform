resource "aws_instance" "my_instance2" {
 ami = "ami-063d4ab14480ac177"
 instance_type = "t2.micro"
 key_name = "terraform"
 vpc_security_group_ids = [aws_security_group.allow_ssh.id]
 subnet_id = aws_subnet.public.id
 associate_public_ip_address = true
 
tags = {
   Name ="My Instance2"
}
}
output "instance_public_ip" {
   value = "${aws_instance.my_instance2.public_ip}"
}
