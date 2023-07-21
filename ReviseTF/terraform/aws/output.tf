output "db_endpoint" {

  value = "terraform-20230712092614300100000001.c6p1nhgrrlks.us-east-1.rds.amazonaws.com:3306"

}

output "ubuntu_ami_id" {

  value = data.aws_ami.ubuntu.id

}


output "web_ip" {

  value = [aws_instance.webserver.public_ip]

}