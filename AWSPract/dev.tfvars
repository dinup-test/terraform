region = "ap-south-1"
ntier_vpc_info = {
  subnet_name     = ["app1", "app2", "db1", "db2", ]
  subnet_azs      = ["a", "b", "a", "b"]
  vpc_range       = "10.100.0.0/16"
  public_subnets  = ["web1", "web2"]
  private_subnets = ["app1", "app2", "db1", "db2"]

}


