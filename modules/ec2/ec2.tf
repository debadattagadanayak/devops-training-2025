resource "aws_instance" "debadatta-ec2" {
  #ami           = "ami-0a25a306450a2cba3"
  ami = var.dev-ami-id
  count = var.novm
  instance_type = var.vm-size
  key_name      = aws_key_pair.dev_key_aws.key_name
  security_groups = [ aws_security_group.allow_tls.name ]
  #vpc_security_group_ids = [ aws_security_group.allow_tls.id ]
  tags = {
    Name = "${var.vm-name}-${count.index}"
  }
  depends_on = [ tls_private_key.dev_key_gen , aws_key_pair.dev_key_aws ]

  # provisioner "remote-exec" {
  #   inline = [ 
  #     "sudo dnf install git httpd -y",
  #     "mkdir -p hello/terraform"
  #    ]
    
  # }
  # connection {
  #   type = "ssh"
  #   user = "ec2-user"
  #   host = self.public_ip
  #   timeout = "3m"
  #   private_key = tls_private_key.dev_key_gen.private_key_pem
  # }
}

