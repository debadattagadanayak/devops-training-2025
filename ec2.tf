resource "aws_instance" "debadatta-ec2" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.dev-ami-id
  instance_type = var.vm-size
  key_name      = var.ec2-key-name
  tags = {
    Name = var.vm-name
  }
}

