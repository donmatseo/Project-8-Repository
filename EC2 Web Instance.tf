# Create Web Instance 1

resource "aws_instance" "Project-8-Web-Instance-1" {
ami = "ami-0d3c032f5934e1b41"
instance_type = "t2.micro"

subnet_id = aws_subnet.Project-8-Web-Subnet-1.id
vpc_security_group_ids = [aws_security_group.Web-SG.id]
availability_zone = "eu-west-3a"  
}

# Create Web Instance 2

resource "aws_instance" "Project-8-Web-Instance-2" {
ami = "ami-0d3c032f5934e1b41"
instance_type = "t2.micro"

subnet_id = aws_subnet.Project-8-Web-Subnet-2.id
vpc_security_group_ids = [aws_security_group.Web-SG.id]
availability_zone = "eu-west-3b"  
}



