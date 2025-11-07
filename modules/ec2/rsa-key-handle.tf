#create rsa based 4096 bits key pair
resource "tls_private_key" "dev_key_gen" {
  algorithm = var.private-key-algo
  rsa_bits  = var.private-key-size
}

#save private key
resource "local_file" "dev_key_private_pem" {
  filename = "${path.module}/dev-key.pem" 
  content  = tls_private_key.dev_key_gen.private_key_pem
  file_permission = 0400
  depends_on = [ tls_private_key.dev_key_gen ]
}


resource "aws_key_pair" "dev_key_aws" {
  key_name   = var.ec2-key-name
  public_key = tls_private_key.dev_key_gen.public_key_openssh
  depends_on = [ tls_private_key.dev_key_gen ]
}