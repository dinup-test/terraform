terraform {

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.6"
    }

  }
}

provider "google" {

  region  = var.region
  project = "charlie-prod-379507"

}