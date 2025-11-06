#publicip of the ec2
output "my-ec2-publicip" {
  value = aws_instance.debadatta-ec2[*].public_ip

}

output "my-ec2-instanceid" {
  value = aws_instance.debadatta-ec2[*].id

}

resource "local_file" "myip" {
  content    = join("\n", aws_instance.debadatta-ec2[*].public_ip)
  filename   = "myip.txt"
  depends_on = [aws_instance.debadatta-ec2]
}
