resource "aws_security_group" "web1" {
name = "websg"
    vpc_id = local.vpc_id
    ingress  {
        from_port = local.ssh_port
        to_port = local.ssh_port
        protocol = local.tcp
        cidr_blocks = [local.anywhere]

    }

    egress {
        from_port = local.http_port
        to_port = local.http_port
        protocol = local.tcp
        cidr_blocks = [local.anywhere]
    }
  tags = {
    name = "websg"
  }

depends_on = [ aws_subnet.subnets ]

}


data "aws_ami" "ubuntu" {

    owners = ["099720109477"]

    most_recent = true
    filter {
      name = "description"
      values = ["Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-02-08"]

    }
 

  filter {
    name = "is-public"
    values = [true]
  }
}



data "aws_subnet" "web" {
  vpc_id = local.vpc_id
  filter {
    name   = "tag:Name"
    values = [var.ntier_vpc_info.web_ec2_subnet]
  }

  depends_on = [
    aws_subnet.subnets
  ]
}



resource "aws_instance" "webserver" {

    ami = local.ami_id
    instance_type = "t2.micro"
    associate_public_ip_address = true

    subnet_id = data.aws_subnet.web.id
    vpc_security_group_ids = [aws_security_group.web1.id]
    tags = {
      Name = "webserver"
    }
  
}