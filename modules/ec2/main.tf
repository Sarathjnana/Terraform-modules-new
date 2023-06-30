resource "aws_instance" "this" {

  count = var.instance_count

  instance_type               = var.instance_type
  ami                         = var.ami == null ? data.aws_ami.ubuntu.id : var.ami
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address 
    #iam_instance_profile   = "S3access"

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = "true"

    tags = {
      Name    = var.server_name 
      Project = var.project
    }
  }
  #user_data = "${file("install_docker.sh")}"
  tags = {
    Name    = var.server_name 
    Project = var.project
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

# get most_recent ubuntu ami 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-${var.name_map[var.release]}-${var.release}-amd64-server-*"]
    #values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
