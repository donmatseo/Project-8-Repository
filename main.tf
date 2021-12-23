# Main VPC

resource "aws_vpc" "Project-8-VPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Project-8 VPC"
  }
}


# Web Subnet 1

resource "aws_subnet" "Project-8-Web-Subnet-1" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Project-8-Web-Subnet-1"
  }
}

# Web Subnet 2

resource "aws_subnet" "Project-8-Web-Subnet-2" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.21.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Project-8-Web-Subnet-2"
  }
}


# Application Subnet 1

resource "aws_subnet" "Project-8-App-Subnet-1" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.22.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Project-8-App-Subnet-1"
  }
}

# Application Subnet 2

resource "aws_subnet" "Project-8-App-Subnet-2" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.23.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Project-8-App-Subnet-2"
  }
}


# Database Subnet 1

resource "aws_subnet" "Project-8-Data-Subnet-1" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.24.0/24"
  availability_zone = "eu-west-3a"

  tags = {
    Name = "Project-8-Data-Subnet-1"
  }
}

# Database Subnet 2

resource "aws_subnet" "Project-8-Data-Subnet-2" {
  vpc_id     = aws_vpc.Project-8-VPC.id
  cidr_block = "10.0.25.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "Project-8-Data-Subnet-2"
  }
}


# Public Route Table

resource "aws_route_table" "Project-8-Public-Route-Table" {
  vpc_id = aws_vpc.Project-8-VPC.id



  tags = {
    Name = "Project-8-Public-Route-Table"
  }
}


# Private Route Table

resource "aws_route_table" "Project-8-Private-Route-Table" {
  vpc_id = aws_vpc.Project-8-VPC.id


  tags = {
    Name = "Project-8-Private-Route-Table"
  }
}

# Association of Web Subnet 1 with Public Route Table

resource "aws_route_table_association" "Project-8-Web-Subnet-1-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-Web-Subnet-1.id
  route_table_id = aws_route_table.Project-8-Public-Route-Table.id
}

# Association of Web Subnet 2 with Public Route Table

resource "aws_route_table_association" "Project-8-Web-Subnet-2-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-Web-Subnet-2.id
  route_table_id = aws_route_table.Project-8-Public-Route-Table.id
}


# Association of Application Subnet 1 with Private Route Table

resource "aws_route_table_association" "Project-8-App-Subnet-1-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-App-Subnet-1.id
  route_table_id = aws_route_table.Project-8-Private-Route-Table.id
}

# Association of Application Subnet 2 with Private Route Table

resource "aws_route_table_association" "Project-8-Application-Subnet-2-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-App-Subnet-2.id
  route_table_id = aws_route_table.Project-8-Private-Route-Table.id
}

# Association of Database Subnet 1 with Private Route Table

resource "aws_route_table_association" "Project-8-Data-Subnet-1-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-Data-Subnet-1.id
  route_table_id = aws_route_table.Project-8-Private-Route-Table.id
}

# Association of Database Subnet 2 with Private Route Table

resource "aws_route_table_association" "Project-8-Data-Subnet-2-Association-With-RT" {
  subnet_id      = aws_subnet.Project-8-Data-Subnet-2.id
  route_table_id = aws_route_table.Project-8-Private-Route-Table.id
}


# Internet Gateway

resource "aws_internet_gateway" "Project-8-IGW" {
  vpc_id = aws_vpc.Project-8-VPC.id

  tags = {
    Name = "Project-8-IGW"
  }
}

# Internet Gateway Association with Public Route Table

resource "aws_route" "IGW-Assoc-With-Pub-RT" {
  route_table_id            = aws_route_table.Project-8-Public-Route-Table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.Project-8-IGW.id
}