#Mongodb atlas private link from SkyHive Live AWS account VPC to MongoDB Atlas Enterpriseqa project for connection to B2C qa databases

# resource "mongodbatlas_privatelink_endpoint" "paas" {
#     project_id = "5cf065b69ccf64b1fc93c21a"
#     provider_name = "AWS"
#     region = "ca-central-1"
# }

# resource "aws_vpc_endpoint" "paas" {
#     vpc_id = module.paas-vpc.this_id
#     service_name = mongodbatlas_privatelink_endpoint.paas.endpoint_service_name
#     vpc_endpoint_type = "Interface" #This property will be constant for MongodbAtlas
#     security_group_ids = [module.paas-sg.sg-id]
#     subnet_ids = module.paas-private-subnets.this_subnets_ids

#     tags = {
#         Name = "qa-mongo-atlas-vpc-endpoint-enterpriseqa"
#         Environment = "${var.paas-env-name}"
#     }
  
# }
