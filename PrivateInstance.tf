/*
# Creating EC2 instance in private subnet

resource "aws_instance" "private-server" {
    ami = "ami-0827b6c5b977c020e"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private.id
    security_groups = [aws_security_group.kazi-sg.id]
    key_name = "US-WEST-1-KEY"

    tags = {
      Name ="private-server"
    }
}
*/
