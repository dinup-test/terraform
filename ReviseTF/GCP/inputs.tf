variable "region" {
  type        = string
  default     = "asia-south1"
  description = "rgion for this resource"


}

variable "ntier_network_interface" {
    type = object({
      vpc_cidr = string
      subnet_names = list(string)
      subnet_azs = list(string)
    })
  default = {
    vpc_cidr = "192.168.0.0/16"
     subnet_azs   = ["a", "b", "a", "b"]
    subnet_names = ["ap1", "app2", "db1", "db2"]
  }
}

