variable "ami_ubuntu" {
  type    = string
  default = "ami-036d46416a34a611c" // ubuntu 20.04 LTS
}

variable "ami_amazon_linux2" {
  type    = string
  default = "ami-0e5b6b6a9f3db6db8" // Amazon Linux 2
}

variable "git_access_token" {
  type = string
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
