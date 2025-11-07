provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket         = "dev-roche-terraform-bucket"
    key            = "dev/deb/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "dev-roche-table1"
    region         = "ap-southeast-2"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

module "debadatta-module-for-ec2" {
  source            = "./modules/ec2"
  ec2-key-name      = "dev-key-final-day"
  private-key-algo  = "RSA"
  private-key-size  = 4096
  vm-name           = "dev-ec2-final-day"
  vm-size           = "t2.small"
  dev-ami-id        = "ami-0a25a306450a2cba3"
  my-vpc-id         = "vpc-02d56e9aa1ce2f114"
  my-sec-group-name = "debadatta-sg"
  novm              = 2

}