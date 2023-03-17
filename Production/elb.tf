#Created application Loadbalancer
resource "aws_lb" "Middleware-Production-LB" {
  name               = "Middleware-Production-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Middleware-Production-LoadBalancer-sg.id]
  #subnets            = [for subnet in aws_subnet.Middleware-Production-PublicsubnetA : Middleware-Production-PublicsubnetB.id]
  subnets = [aws_subnet.Middleware-Production-PublicsubnetA.id , aws_subnet.Middleware-Production-PublicsubnetB.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

#Created Target Group for above Loadbalancer
resource "aws_lb_target_group" "Middleware-production-Jenkins-tg" {
  name     = "Middleware-production-Jenkins-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Middleware-Production-VPC.id
}

# Created target group attachment
resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.Middleware-production-Jenkins-tg.arn
  target_id        = aws_instance.Middleware-Production-Jenkins-server.id
  port             = 8080
}

#Listener rule for HTTP traffic on each of the ALBs
resource "aws_lb_listener" "jenkins" {
  load_balancer_arn = aws_lb.Middleware-Production-LB.arn
  port              = "80"
  protocol          = "HTTP"
  # ssl_policy        = "ELBSecurityPolicy-2016-08"
  # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"
  
  #######################  Redirect is Pending   ##############################
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Middleware-production-Jenkins-tg.arn
  }
}