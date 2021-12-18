resource "aws_instance" "comroom-back" {
  ami             = var.ami_ubuntu
  instance_type   = "t2.micro"
  security_groups = [data.terraform_remote_state.vpc.outputs.security_group_name]

  tags = {
    Name  = "comroom-back"
    "for" = "hitsweb"
  }

  user_data = <<-EOF
    #!/bin/bash
    cd /home/ubuntu/hits_Platform_backend
    git checkout -t remotes/origin/main
    git pull
    EOF
}

data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "hitsweb-terraform-state"
    key    = "prod/vpc/terraform.tfstate"
    region = "us-west-2"
  }
}
