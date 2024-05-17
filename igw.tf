
//creating an internet gateway

resource "aws_internet_gateway" "kazi-igw" {
    vpc_id = aws_vpc.Kazi.id

    tags = {
      Name = "kazi-igw"
    }

}

