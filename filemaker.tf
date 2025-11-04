resource "local_file" "myip" {
  content  = aws_instance.debadatta-ec2.public_ip
  filename = "myip.txt"
}
