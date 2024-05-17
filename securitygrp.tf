
resource "aws_security_group" "kazi-sg" {
  name        = "kazi-sg"
  description = "Allow all inbound and outbound traffic"
  vpc_id = aws_vpc.Kazi.id

tags = {
    Name = "kazi-sg"
  }

# Ingress rules (incoming traffic)

ingress {
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"       # SSH protocol is TCP
  cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere
}


# Egress rules (outgoing traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # -1 represents all protocols
    cidr_blocks = ["0.0.0.0/0"] #Allow All Outbound traffic
  }
}