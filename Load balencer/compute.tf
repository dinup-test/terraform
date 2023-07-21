resource "google_compute_instance" "apache2" {

  name = "apacheserver"

  zone = "us-west1-b"

  machine_type              = "n1-standard-2"
  allow_stopping_for_update = "true"
  
  network_interface {
    network    = google_compute_network.Ntier.id
    subnetwork = google_compute_subnetwork.web1.id
    access_config {
      
    }
  }

  tags = ["web"]

  metadata_startup_script = "echo hi > /test.txt"

 




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
