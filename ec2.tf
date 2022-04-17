data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

resource "aws_instance" "ec2_1" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "ec2"
  subnet_id                   = aws_subnet.public_subnet_1.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.vpc_sg.id}"]
  user_data                   = file("data.sh")

  tags = {
    "Name" = "EC2 instance 1"
  }

}

resource "aws_instance" "ec2_2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = "ec2"
  subnet_id                   = aws_subnet.public_subnet_2.id
  user_data                   = file("data.sh")
  vpc_security_group_ids      = ["${aws_security_group.vpc_sg.id}"]
  associate_public_ip_address = true

  tags = {
    "Name" = "EC2 instance 2"
  }
}
