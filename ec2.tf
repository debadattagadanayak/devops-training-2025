resource "aws_instance" "debadatta-ec2" {
  #ami           = "ami-0a25a306450a2cba3"
  ami           = var.dev-ami-id
  instance_type = var.vm-size
  key_name      = aws_key_pair.dev_key_aws.key_name
  tags = {
    Name = var.vm-name
  }
}

