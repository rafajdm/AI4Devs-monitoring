resource "aws_iam_user" "deploy_user" {
  name = "deploy-user"
}

resource "aws_iam_group" "deploy_group" {
  name = "deploy-group"
}

resource "aws_iam_group_membership" "deploy_user_membership" {
  name  = "deploy-user-membership"
  users = [aws_iam_user.deploy_user.name]
  group = aws_iam_group.deploy_group.name
}

resource "aws_iam_policy_attachment" "deploy_policy" {
  name       = "deploy-policy-attach"
  groups     = [aws_iam_group.deploy_group.name]
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
