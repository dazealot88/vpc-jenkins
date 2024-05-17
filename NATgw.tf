/*
#Creating Elastic IP for the NAT Gateway

resource "aws_eip" "kazi-eip" {
       domain = "vpc"
       depends_on = [aws_internet_gateway.kazi-igw]
       tags = {
       Name="demo_nat_gateway_eip"
    }
}



#Creating NAT Gateway for VPC

resource "aws_nat_gateway" "kazi-natgw" {
  allocation_id = aws_eip.kazi-eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "kazi-natgw"
  }
}
*/

// in terraform, to comment an entire code use /* at the beginning of the code and */ at the end of the code