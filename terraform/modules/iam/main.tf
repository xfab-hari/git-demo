
resource "aws_iam_role" "shared_service_role" {
  name = "SharedServiceRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "shared_policy" {
  name = "SharedAccessPolicy"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:*",
          "rds:*"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "shared_attachment" {
  role       = aws_iam_role.shared_service_role.name
  policy_arn = aws_iam_policy.shared_policy.arn
}

resource "aws_iam_instance_profile" "shared_instance_profile" {
  name = "SharedServiceInstanceProfile"
  role = aws_iam_role.shared_service_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.shared_instance_profile.name
}
