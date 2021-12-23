# Create Application Load Balancer

resource "aws_lb" "Project-8-lb" {
  name               ="Project-8-load-balancer"
  internal           = false
  load_balancer_type = "application"

  subnets   = [
    aws_subnet.Project-8-Web-Subnet-1.id , 
    aws_subnet.Project-8-Web-Subnet-2.id]
  
security_groups = [aws_security_group.Web-SG.id]

  enable_deletion_protection = false

  tags = {
    Name = "Project-8-lb"
  }
}
# Create Target Group
# Terraform aws create target group

resource "aws_lb_target_group" "Project-8-TG" {
  name     = "Project-8-TG"
  target_type = "ip"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Project-8-VPC.id
}

# Create a listener on port 80

   resource "aws_lb_listener" "Project_8_listener_group" {
  load_balancer_arn = aws_lb.Project-8-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
target_group_arn = aws_lb_target_group.Project-8-TG.arn
  }
}