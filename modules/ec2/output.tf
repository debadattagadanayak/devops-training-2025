#publicip of the ec2
output "my-ec2-publicip" {
  value = aws_instance.debadatta-ec2[*].public_ip

}

output "my-ec2-instanceid" {
  value = aws_instance.debadatta-ec2[*].id

}

resource "local_file" "myip" {
  filename   = "${path.module}/ansible-inventory.txt"
  content = "[web-servers]\n${join("\n", aws_instance.debadatta-ec2[*].public_ip)}"
#   content    = <<EOT
# [web-servers]
# ${join("\n", aws_instance.debadatta-ec2[*].public_ip)}
# EOT
  depends_on = [aws_instance.debadatta-ec2]
}
