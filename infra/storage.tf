# Define your AWS provider
provider "aws" {
    region = "eu-west-1"
}

# Define your S3 bucket and file
data "aws_s3_bucket" "project" {
    bucket = var.target_bucket
}

resource "aws_s3_object" "sample_data" {
    bucket = data.aws_s3_bucket.project.id
    key    = "raw/temperatures_state_year.csv"
    source = "../data/temperatures_state_year.csv"

    tags = {
        Project = "Glue-Terraform-Demo"
        Owner   = "Terraform"
    }
}

