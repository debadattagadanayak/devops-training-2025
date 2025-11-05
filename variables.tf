variable "dev-ami-id" {
  type        = string
  description = "This is my sydney aws region ami id"
  #default = "ami-0a25a306450a2cba3"

}

variable "vm-name" {
  type        = string
  description = "my aws vm name"

}

variable "vm-size" {
  type        = string
  description = "my aws vm size"

}

variable "ec2-key-name" {
  type        = string
  description = "my aws ec2 key name"

}

variable "private-key-algo" {
  type        = string
  description = "private key algorithm"

}

variable "private-key-size" {
  type        = number
  description = "private key size"

}