resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database_subnet_1.id, aws_subnet.database_subnet_2.id]
  tags = {
    Name = "My DB subnet group"
  }
}
