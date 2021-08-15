
provider "aws" {
  region = var.aws_region
}

#Centralizar o arquivo de controle de estado do terraform
terraform {
  backend "s3" {
    bucket = "terraform-state-lucas-igti"
    key = "state/igti/edc/mod1/usecase01/terraform.tfstate"
    region = "us-east-2"
  }
} 