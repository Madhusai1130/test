resource "aws_iam_policy" "parameter-store-serviceaccount-policy" {
  count       = var.CREATE_PARAMETER_STORE ? 1 : 0
  name        = "ParameterStore-ssm-${var.ENV}-eks-cluster"
  path        = "/"
  description = "ParameterStore-ssm-${var.ENV}-eks-cluster"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "ssm:DescribeParameters",
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        "Resource": "*"
      }
    ]
  })
}

resource "aws_iam_role" "parameter-store-oidc-role" {
  count       = var.CREATE_PARAMETER_STORE ? 1 : 0
  name               = "parameter-store-role-with-oidc"
  assume_role_policy = data.aws_iam_policy_document.external-secrets-policy_document.json
}

resource "aws_iam_role_policy_attachment" "parameter-store-role-attach" {
  count       = var.CREATE_PARAMETER_STORE ? 1 : 0
  role       = aws_iam_role.parameter-store-oidc-role.*.name[0]
  policy_arn = aws_iam_policy.parameter-store-serviceaccount-policy.*.arn[0]
}



