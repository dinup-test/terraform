resource "google_compute_network" "Ntier" {
  name                    = "myvpc"
  mtu                     = "1460"
  auto_create_subnetworks = false

  description = "vpc for LB"

}

resource "google_compute_subnetwork" "web1" {

  name          = var.name1
  ip_cidr_range = var.cidr_blocks_public1
  network       = google_compute_network.Ntier.id
  description   = "for apache"
}

resource "google_compute_subnetwork" "web2" {

  name          = var.name2
  ip_cidr_range = var.cidr_blocks_public2
  network       = google_compute_network.Ntier.id
  description   = "for nginx"
}


resource "google_compute_firewall" "allowfor_web" {

  name    = "allowhttp"
  network = google_compute_network.Ntier.id
  allow {
    ports    = ["22", "80"]
    protocol = "tcp"
  }
  allow {

    protocol = "icmp"
  }
  description   = "allow on web for lb"
  source_ranges = var.source_ranges
  target_tags   = ["web"]


}



