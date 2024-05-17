
#Creating EC2 instance in public subnet

resource "aws_instance" "Test-DEV" {
    ami = "ami-08012c0a9ee8e21c4"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public.id
    security_groups = [aws_security_group.kazi-sg.id]
    key_name = "US-WEST-1-KEY"

    tags = {
      Name ="Test-DEV"
    }
  
  //these commands will install jenkins as a service
  //Git, Maven and Java will also be installed

user_data = <<-EOF
    #!/bin/bash
      sudo apt update
      sudo apt install git maven -y
      sudo apt install openjdk-11-jdk
      sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
      https://pkg.jenkins.io/debian/jenkins.io-2023.key
      echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
      https://pkg.jenkins.io/debian binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /Test-/null
      sudo apt-get update
      sudo apt-get install jenkins
      sudo systemctl enable jenkins
      sudo systemctl start jenkins
      sudo systemctl status jenkins
    EOF
}

