locals {
  vpc_id    = aws_vpc.ntier.id
  anywhere  = "0.0.0.0/0"
  tcp       = "tcp"
  ssh_port  = 22
  http_port = 80
}