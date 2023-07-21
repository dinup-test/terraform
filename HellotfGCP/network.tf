resource "google_compute_network" "ntier" {


  name                    = "ntier"
  auto_create_subnetworks = "false"

  routing_mode = "GLOBAL"
  mtu          = "1460"
}

resource "google_compute_subnetwork" "subnets" {
  count         = length(var.ntier_cidrs)
  ip_cidr_range = var.ntier_cidrs[count.index]
  name          = var.name[count.index]


  network = google_compute_network.ntier.id

  depends_on = [
    google_compute_network.ntier
  ]
}



