terraform {
  backend "s3" {
    region = "<region>"
    bucket = "<bucket>"
    key = "<keyName>/terraform.tfstate"
    role_arn = "<ROLE_ARN>"
    session_name = "terraform_sandbox_session"
    kms_key_id = "<kms_key_id>"
    encrypt = "true"
    dynamodb_table = "<dynamodb_table>"
  }
}

provider "aws" {
    assume_role {
      role_arn = "arn:aws:iam::<ACCOUNTID>:role/<ROLENAME>"
      session_name = "<SESSION_NAME>"
    }
    region = "<REGION>"
    alias = "<ALIAS_NAME>"
}

data "aws_caller_identity" "current"   {}
