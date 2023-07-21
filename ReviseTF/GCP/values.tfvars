region                  = "asia-east1"
ntier_network_interface = {
  subnet_azs = [ "a", "b", "a", "b", "a", "b"]
  subnet_names = [ "ap1", "app2", "db1", "db2", "web1", "web2" ]
  vpc_cidr = "10.100.0.0/16"
}