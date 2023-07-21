resource "google_service_account" "k8s" {
  account_id   = "kubrnates"
  display_name = "k8-svc"

}

resource "google_container_cluster" "first" {
  name     = "k8s-retails"
  location = "us-central1-a"

  network                  = "production"
  subnetwork               = "public"
  remove_default_node_pool = true
  initial_node_count       = 1

}

resource "google_container_node_pool" "pool1" {
  name       = "myfirst"
  location   = "us-central1"
  cluster    = google_container_cluster.first.name
  node_count = 1


  node_config {
    preemptible  = true
    machine_type = "e2.meduim"

    service_account = google_service_account.k8s.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]


  }
}


