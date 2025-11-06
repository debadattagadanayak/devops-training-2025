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
}

module "debadatta-module-for-ec2" {
  source            = "./modules/ec2"
  ec2-key-name      = "dev-key"
  private-key-algo  = "RSA"
  private-key-size  = 4096
  vm-name           = "dev-ec2"
  vm-size           = "t2.nano"
  dev-ami-id        = "ami-0a25a306450a2cba3"
  my-vpc-id         = "vpc-02d56e9aa1ce2f114"
  my-sec-group-name = "debadatta-sg"
  novm              = 2

}