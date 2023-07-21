resource "aws_instance" "apache" {

  ami = "ami-0fcf52bcf5db7b003"

  associate_public_ip_address = true
  subnet_id                   = "subnet-039782a5d7f39059a"
  instance_type               = "t3.large"
  vpc_security_group_ids      = [aws_security_group.web.id]
  key_name = "mykey"
  tags = {
    Name = "web2"
  }


  depends_on = [

    aws_security_group.web
  ]



}