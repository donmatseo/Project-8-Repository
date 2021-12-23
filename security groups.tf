# Create security group

resource "aws_security_group" "Web-SG" {
name = "Web-SG"
vpc_id = aws_vpc.Project-8-VPC.id

ingress {

from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]

}

ingress {

from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]



}
}