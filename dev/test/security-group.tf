module "skyhive-sg" {
    source = "../../mono-infra/modules/securitygroup/"

    sg-name = "skyhive-eks-eg"
    vpc-id = module.vpc.this_id
    env-name = var.env-name
    sg-rules = var.sg-rules
  
}