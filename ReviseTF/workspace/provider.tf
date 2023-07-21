
provider "aws" {
  # Configuration options
  region = var.region
}

/*# Backend must remain commented until the Bucket
 and the DynamoDB table are created. 
 After the creation you can uncomment it,
 run "terraform init" and then "terraform apply" */
terraform {
  backend "s3" {
    bucket         = "charlie-tf-test-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tfstate_teraform"

  }
}