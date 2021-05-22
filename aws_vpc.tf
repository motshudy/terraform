resource "aws_vpc" "my_vpc" {
 cidr_block       = "10.0.0.0/24"
 enable_dns_hostnames = true
 
 tags = {
   Name = "My VPC"
 }
}
resource "aws_subnet" "public" {
 vpc_id     = aws_vpc.my_vpc.id
 cidr_block = "10.0.0.0/24"
 availability_zone = "eu-west-1a"
 
 tags = {
   Name = "Public Subnet"
 }
}
resource "aws_internet_gateway" "my_vpc_igw" {
 vpc_id = aws_vpc.my_vpc.id
 
 tags = {
   Name = "My VPC - Internet Gateway"
 }
}
 
resource "aws_route_table" "my_vpc_eu_west_1a_public" {
   vpc_id = aws_vpc.my_vpc.id
 
   route {
       cidr_block = "0.0.0.0/0"
       gateway_id = aws_internet_gateway.my_vpc_igw.id
   }
 
   tags = {
       Name = "Public Subnet Route Table."
   }
}
 
resource "aws_route_table_association" "my_vpc_eu_west_1a_public" {
   subnet_id = aws_subnet.public.id
   route_table_id = aws_route_table.my_vpc_eu_west_1a_public.id
}
