
variable "ntier_cidrs" {
  type    = list(string)
  default = ["10.200.0.0/24", "10.200.1.0/24", "10.200.2.0/24", "10.200.3.0/24"]
}

variable "name" {

  type    = list(string)
  default = ["app1", "app2", "db1", "db2"]


}


