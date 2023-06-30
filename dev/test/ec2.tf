# ec2

module "appserver_a" {
    source = "../../mono-infra/modules/ec2"
    
  instance_count              = var.instance_count
  server_name                 = var.server_name
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address
  volume_size                 = var.volume_size
  project                     = var.project

}