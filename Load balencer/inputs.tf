variable "region" {
  type    = string
  default = "us-west1"
}

variable "cidr_blocks_public1" {
  type    = string
  default = "10.0.1.0/24"

}

variable "cidr_blocks_public2" {
  type    = string
  default = "10.0.2.0/24"

}

variable "name1" {

  type    = string
  default = "publicc1"
}

variable "name2" {

  type    = string
  default = "public2"
}

variable "source_ranges" {

  type    = list(string)
  default = ["0.0.0.0/0"]

}