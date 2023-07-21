variable "location" {
    type = string
    default = "westus"
    description = "location for for resources"
  
}

variable "vnet-rang" {

    type = list(string)
    default = [ "192.168.0.0/16" ]
    dedescription = "cidr blocks" 
}