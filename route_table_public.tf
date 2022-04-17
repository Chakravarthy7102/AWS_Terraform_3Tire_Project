resource "aws_route_table" "route" {
  vpc_id = aws_vpc.my_vpc.id

  depends_on = [
    aws_internet_gateway.my_ig
  ]
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_ig.id
  }



  tags = {
    "Name" = "Public Internet Gateway"
  }
}

# Associating the route tables 
# Provides a resource to create an association between a route table and a subnet or
# a route table and an internet gateway or virtual private gateway.

resource "aws_route_table_association" "route_ass_1" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "route_ass_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.route.id
}
