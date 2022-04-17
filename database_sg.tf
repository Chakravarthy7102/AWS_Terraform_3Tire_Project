resource "aws_security_group" "database_sg" {
  vpc_id      = aws_vpc.my_vpc.id
  description = "Allow inbound traffic from application layer"

  ingress {
    description     = "Allow traffic from the application layer"
    from_port       = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.vpc_sg.id}"]
    to_port         = 3306
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "Database SG"
  }
}
