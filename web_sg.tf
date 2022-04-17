resource "aws_security_group" "vpc_sg" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Inbound rule for ssh client"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Inbound rule for http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Inbound rule all the HTTPS trafic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

  }

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internet access from the EC2 to anywhere"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
  }

  tags = {
    "Name" = "Web Security Groups"
  }
}
