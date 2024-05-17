
//public subnet

resource "aws_subnet" "public" {
  vpc_id = aws_vpc.Kazi.id
  cidr_block = "44.32.1.0/24"
  availability_zone = "us-west-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public"
  }
}


//private subnets

resource "aws_subnet" "private" {
  vpc_id = aws_vpc.Kazi.id
  cidr_block = "44.32.2.0/24"
  availability_zone = "us-west-1c"

  tags = {
    Name = "private"
  }
}