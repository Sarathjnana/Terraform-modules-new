# Terraform AWS EC2 Instance Module

By using this Terraform module we can create one or more EC2 instances in AWS with configurable options

# Usage

This is a Terraform module code that defines an AWS EC2 instance resource using the "aws_instance" resource type
The AWS instance resource is configured with various attributes such as

+ Instance type
+ AMI
+ Subnet ID
+ Key pair
+ Security groups
+ Public IP address
+ Block device

The module also uses the "data" block to get the most recent Ubuntu AMI ID from AWS, this AMI ID is used if an AMI ID is not specified in the input variables file
Additionally, the module sets tags for the instance and its root volume, and also sets a lifecycle block to ignore any changes made to the AMI ID 


# Multiple EC2 Instance with block device 

```
resource "aws_instance" "this" {

  count = var.instance_count

  instance_type               = var.instance_type
  ami                         = var.ami == null ? data.aws_ami.ubuntu.id : var.ami
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address == null ? false : var.associate_public_ip_address

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = "true"

    tags = {
      Name    = var.server_name == null ? "${var.server_name}-rootvol" : var.server_name
      Project = var.project
    }
  }

  tags = {
    Name    = var.server_name == null ? "${var.project}-server-${count.index}" : var.server_name
    Project = var.project
  }
}

```

Have to specify the inputs for the below variables in the terraform.tfvars file 
+ instance_type
+ instance_count
+ ami 
+ subnet_id
+ key_name
+ vpc_security_group_ids
+ associate_public_ip_address
+ volume_size 
+ server_name
+ Project


# Life-cycle for ami 
```
lifecycle {
    ignore_changes = [ami]
  }
```

This means that if the AMI ID changes, Terraform will not attempt to update the resource to use the new AMI

# Data block get most_recent ubuntu ami

``` 
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-${var.name_map[var.release]}-${var.release}-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

```

This data block will gets the latest ubuntu id, Have to specify the inputs for the below variables in the terraform.tfvars file 

+ release
+ name_map


# Conditional statements 

### ami = var.ami == null ? data.aws_ami.ubuntu.id : var.ami
 
+ If the input variable var.ami is null, it uses the AMI ID obtained from the "data" block data.aws_ami.ubuntu.id
Otherwise, it uses the AMI ID provided in the var.ami input variable
 
### associate_public_ip_address = var.associate_public_ip_address == null ? false : var.associate_public_ip_address

+ If the input variable var.associate_public_ip_address is null, it sets it to false
Otherwise, it uses the value provided in the var.associate_public_ip_address input variable
 
### Name = var.server_name == null ? "${var.project}-server-${count.index}" : var.server_name
 
+ If the input variable var.server_name is null
+ Then it will set the tag to "${var.project}-server-${count.index}", where count.index is the index of the current instance being created (Example - project0, project1, project2, project3, ……..)
+ Otherwise, it uses the value provided in the var.server_name input variable

### ami = var.ami == null ? data.aws_ami.ubuntu.id : var.ami

+ If the input variable var.server_name is null, it sets the tag to "${var.server_name}-rootvol"
Otherwise, it uses the value provided in the var.server_name input variable
 
## name = "ubuntu/images/hvm-ssd/ubuntu-${var.name_map[var.release]}-${var.release}-amd64-server-*"
 
+ This sets the name filter to match the name pattern of the Ubuntu AMI
Ubuntu release version specified in the var.release input variable, and the * wildcard matches any further characters in the AMI name

# Outputs

## The following outputs available

+ Instance_ids: The IDs of the instances which has created
+ Private_ip_addresses: The private IP addresses of the instances
+ Public_ip_addresses: The public IP addresses of the instances (if associate_public_ip_address is true)
+ Ami_ids : The ID of the created Ami
+ Arn : Arn for the created instances
+ Private_dns: The private DNS name assigned to the instance



# This Terraform module is used to create a specified number of EC2 instances in AWS with Ubuntu AMIs and additional configuration

