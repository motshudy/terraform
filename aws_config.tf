resource "aws_launch_configuration" "web" {
 name_prefix = "web-"
 
 image_id = "ami-063d4ab14480ac177"
 instance_type = "t2.micro"
 key_name = "terraform"
 
 security_groups = [ aws_security_group.allow_ssh.id ]
 associate_public_ip_address = true
 
 user_data = <<USER_DATA
#!/bin/bash
yum update
yum -y install httpd -y
service httpd start
chkconfig httpd on
cd/var/www/html
echo "<html><h1>The webserver works!</h1></html>" > index.html
 
 USER_DATA
 
 lifecycle {
   create_before_destroy = true
 }
}
