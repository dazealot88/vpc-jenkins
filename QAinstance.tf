
// creating EC2 instance with tomcat9 installed
  
resource "aws_instance" "Test-QA" {
    ami = "ami-08012c0a9ee8e21c4"    //ubuntu ami
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    security_groups = [aws_security_group.kazi-sg.id]
    key_name = "US-WEST-1-KEY"

    tags = {
      Name ="Test-QA"
    }
  
  //these commands will install tomcat9

user_data = <<-EOF
    #!/bin/bash
      sudo apt update
	  sudo apt install tomcat9 -y
	  sudo apt install tomcat9-admin -y
	  sudo systemctl start tomcat9 
	  sudo systemctl status tomcat9
    EOF

}