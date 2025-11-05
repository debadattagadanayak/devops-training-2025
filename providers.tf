terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
 
terraform {
  backend "s3" {
    bucket = "dev-roche-terraform-bucket"
    key    = "dev/deb/terraform.tfstate"
    encrypt = true
    dynamodb_table = "dev-roche-table1"
    region = "ap-southeast-2"
    
  }
}
