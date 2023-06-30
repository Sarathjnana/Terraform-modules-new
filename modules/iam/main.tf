resource "aws_iam_instance_profile" "server_profile" {
  name = "server_profile"
  role = aws_iam_role.role.name
}

resource "aws_iam_role" "role" {
  name = "application_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Assume Permissions",
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow"
        },
        {
            "Sid": "Common Permissions",
            "Action": [
                "s3:*",
                "cloudfront:*",
                "cloudwatch:*",
                "autoscaling:*",
                "logs:*",
                "secretsmanager:*",


            ]
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }

    ]
}
EOF
}