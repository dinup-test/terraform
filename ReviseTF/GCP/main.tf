resource "google_compute_network" "ntier" {

  name                    = "ntiervpc"
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"


}

resource "google_compute_subnetwork" "subnetworks" {

  count = length(var.ntier_network_interface.subnet_names)

  ip_cidr_range = cidrsubnet(var.ntier_network_interface.vpc_cidr, 8, count.index)
  name          = var.ntier_network_interface.subnet_names[count.index]


  network = google_compute_network.ntier.id

}
