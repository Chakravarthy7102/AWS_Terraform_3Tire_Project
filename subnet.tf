resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az1
  cidr_block              = var.subnet-1-cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Web subnet 1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az2
  cidr_block              = var.subnet-2-cidr
  map_public_ip_on_launch = true

  tags = {
    "Name" = "Web subnet 2"
  }
}

resource "aws_subnet" "application_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az1
  cidr_block              = var.subnet-3-cidr
  map_public_ip_on_launch = false

  tags = {
    "Name" = "Application subnet 1"
  }
}

resource "aws_subnet" "application_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az2
  cidr_block              = var.subnet-4-cidr
  map_public_ip_on_launch = false

  tags = {
    "Name" = "Application subnet 2"
  }
}

resource "aws_subnet" "database_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az1
  cidr_block              = var.subnet-5-cidr
  map_public_ip_on_launch = false

  tags = {
    "Name" = "Database subnet 1"
  }
}

resource "aws_subnet" "database_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = var.az1
  cidr_block              = var.subnet-6-cidr
  map_public_ip_on_launch = false

  tags = {
    "Name" = "Database subnet 2"
  }
}
