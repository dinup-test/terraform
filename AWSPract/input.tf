

variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "region"

}


variable "ntier_vpc_info" {
  type = object({
    vpc_range       = string
    subnet_azs      = list(string)
    subnet_name     = list(string)
    public_subnets  = list(string)
    private_subnets = list(string)
    




    }
  )
  default = {
    subnet_name     = ["app1", "app2", "db1", "db2"]
    subnet_azs      = ["a", "b", "a", "b", ]
    vpc_range       = "192.168.0.0/16"
    public_subnets  = []
    private_subnets = ["app1", "app2", "db1", "db2"]
    

  }
}



