resource "google_compute_instance" "apache2" {

  name                      = "apacheserver"
  zone                      = "asia-south1-c"
  machine_type              = "e2-meduim"
  allow_stopping_for_update = "true"

  tags = ["web1"]

  


  boot_disk {

    auto_delete = "true"
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }
  scratch_disk {

    interface = "SCSI"
  }

  
}

