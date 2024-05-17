
# Creating Network ACL at the Public Subnet

resource "aws_network_acl" "pub-nacl" {
  vpc_id = aws_vpc.Kazi.id
  subnet_ids = [aws_subnet.public.id]

  ingress {
    protocol = "tcp"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 22
    to_port = 22
  }
  
  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "0.0.0.0/0"
    from_port = 0
    to_port = 0
  }
  tags = {
    Name = "pub-nacl"
  }
}
