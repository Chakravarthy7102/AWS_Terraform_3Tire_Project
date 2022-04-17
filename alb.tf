resource "aws_lb" "external_lb" {
  name               = "External"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.vpc_sg.id]
  subnets            = ["${aws_subnet.public_subnet_1.id}", "${aws_subnet.public_subnet_2.id}"]

  #   enable_deletion_protection = true
  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "lbgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}

resource "aws_lb_target_group_attachment" "attachment-1" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.ec2_1.id
  port             = 80
  depends_on = [
    aws_instance.ec2_1
  ]
}

resource "aws_lb_target_group_attachment" "attachment-2" {
  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = aws_instance.ec2_2.id
  port             = 80
  depends_on = [
    aws_instance.ec2_2
  ]
}

resource "aws_lb_listener" "external_listener" {
  load_balancer_arn = aws_lb.external_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

}
