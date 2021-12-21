variable "ami_ubuntu_arm" {
  type    = string
  default = "ami-03665e633d23b2df6" // ubuntu 20.04 LTS Arm
}

variable "ami_ubuntu_x86" {
  type    = string
  default = "ami-0454bb2fefc7de534" // ubuntu 20.04 LTS x86
}

variable "ami_amazon_linux2" {
  type    = string
  default = "ami-0eb14fe5735c13eb5" // Amazon Linux 2
}

variable "server_port" {
  description = "The port the server will use for HTTP request"
  type        = number
  default     = 8080
}

variable "access_key" {
  description = "The access key for the AWS account"
  type        = string
}

variable "secret_key" {
  description = "The secret key for the AWS account"
  type        = string
}

variable "git_access_token" {
  description = "The git token for the AWS account"
  type        = string
}
