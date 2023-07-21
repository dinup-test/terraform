
variable "region" {

  type        = string
  default     = "ap-south-1"
  description = "region to create resources"


}

variable "ntier_vpc_info" {

  type = object({
    vpc_cidr        = string
    subnet_azs      = list(string),
    subnet_names    = list(string),
    public_subnets  = list(string),
    private_subnets = list(string)
    db_subnets      = list(string)
    web_ec2_subnet  = string


  })
  default = {
    subnet_azs      = ["a", "b", "a", "b", "a", "b"]
    subnet_names    = ["ap1", "app2", "db1", "db2", "web1", "web2"]
    vpc_cidr        = "192.168.0.0/16"
    public_subnets  = ["web1", "web2"]
    private_subnets = ["ap1", "app2", "db1", "db2"]
    db_subnets      = ["db1", "db2"]
    web_ec2_subnet  = "web1"



  }
  description = "cidr block for vpc"

}

