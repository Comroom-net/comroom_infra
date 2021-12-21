# resource "aws_instance" "comroom-back" {
#   ami             = var.ami_ubuntu
#   instance_type   = "t2.micro"
#   security_groups = [data.terraform_remote_state.global.outputs.comroom_security_group_id]

#   tags = {
#     Name = "comroom-back"
#   }

#   user_data = data.template_file.post_install.rendered
# }

resource "aws_spot_instance_request" "comroom-spot" {
  ami             = var.ami_ubuntu_x86
  instance_type   = "t3.small"
  security_groups = [data.terraform_remote_state.global.outputs.comroom_security_group_name]

  tags = {
    Name = "spot_comroom"
  }

  user_data = data.template_file.post_install.rendered
}

data "terraform_remote_state" "global" {
  backend = "s3"

  config = {
    bucket = "comroom-terraform-state"
    key    = "prod/global/terraform.tfstate"
    region = "ap-northeast-2"
  }
}

data "template_file" "post_install" {
  template = file("post_install.sh.tpl")

  vars = {
    git_access_token = var.git_token
  }
}
