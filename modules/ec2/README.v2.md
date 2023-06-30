# Terraform AWS EC2 Instance Module

For this Ec2 module there are some dependencies like VPC, Subnet, Security group and Key pair 

+ VPC - We need to give the vpc Id 
+ Subnets  - We have to mention the subnets related to the given vpc 
+ Security group - we need to give the related security group id
+ Key pair - Mention the name of the key pair or create one in aws  


# Declare the below input varaibles in variable.tf in the main terraform directory 
```

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "server_name" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "volume_size" {
  type = number
}

variable "project" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "subnet_id" {
  type = string
}

variable "associate_public_ip_address" {
  type    = bool
  default = true
}

```

# Provide the values for the variables declared in terraform.tfvars file in terraform main directory 

```

# ec2 

instance_count               = <Number of instances>
server_name             	 = <Name of the project>
instance_type          		 = <Instance type>
subnet_id           	     = <Subnet id>
key_name           	         = <Name of the key>
vpc_security_group_ids 		 = <Security group id>
associate_public_ip_address  = <True of False>
volume_size           		 = <Size of voloum>
project               		 = <Name of the project>


```

# Note

Here in the module we have used a ternary operator to accept value

+ if we haven't given value to variable of AMi it will automatically takes an ubuntu ami 
+ Same for associate_public_ip_address and server_name 
+ Please make sure that give the appropate value for var.release in the varable.tf in module by default it will take the latest version 

