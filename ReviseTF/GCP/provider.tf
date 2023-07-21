terraform {
  required_providers {
    google ={
        source = "hashicorp/google"
        version = "4.70.0"

    }
  }
}

provider "google" {

    project = "charlie-prod-379507"
    region = var.region
  
}