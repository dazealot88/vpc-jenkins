
#public rt

resource "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.Kazi.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.kazi-igw.id
    }
  
  tags = {
    Name = "public-rt"
  }
}

//private rt

resource "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.Kazi.id

  tags = {
    Name = "private-rt"
  }
  
}