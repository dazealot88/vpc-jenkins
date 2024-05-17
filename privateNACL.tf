
#Creating Network ACL at the Private Subnet

resource "aws_network_acl" "pri-nacl" {
  vpc_id = aws_vpc.Kazi.id
  subnet_ids = [aws_subnet.private.id]
  

  ingress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "44.32.0.0/16" #allowing inbound traffic only within the vpc
    from_port = 0
    to_port = 0
  }
  
  egress {
    protocol = "-1"
    rule_no = 100
    action = "allow"
    cidr_block = "44.32.0.0/16" #allowing outbound traffic only within the vpc
    from_port = 0
    to_port = 0
  }
  tags = {
    Name = "pri-nacl"
  }
}