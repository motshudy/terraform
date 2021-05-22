resource "aws_lb" "test" {
 name               = "test-lb-tf"
 internal           = false
 load_balancer_type = "application"
 
 enable_deletion_protection = true
 
 access_logs {
   bucket  = "arn:aws:s3:::terrabucketmel"
   prefix  = "test-lb"
   enabled = true
 }
 
 tags = {
   Name = "ABL"
 }
}
