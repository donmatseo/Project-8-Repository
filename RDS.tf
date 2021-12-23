# Create Database Instance

resource "aws_db_instance" "Project-8-Data-Instance" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "dmo"
  password             = "passdmoos"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  availability_zone = "eu-west-3a"

 }

# Database Subnet Group

resource "aws_db_subnet_group" "Project-8-db-SG" {
  name       = "main"
  subnet_ids = [aws_subnet.Project-8-Data-Subnet-1.id,aws_subnet.Project-8-Data-Subnet-2.id]

  tags = {
    Name = "Project-8-db-SG"
  }
}


# Create Database Security Group

resource "aws_security_group" "db-SG" {
  name        = "db-SG"
  description = "Allow http inbound traffic "
  vpc_id      = aws_vpc.Project-8-VPC.id

  
ingress {
    description      = "HTTP from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
     }

  tags = {
    Name = "db-SG"


  }
}


