resource "aws_iam_role" "iam_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy

  tags               = local.tags
}

resource "aws_iam_role_policy" "iam_role_policy" {
  count  = var.create_iam_role_policy ? 1 : 0
  name   = var.iam_role_policy_name
  role   = aws_iam_role.iam_role.id
  policy = var.iam_role_policy
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  count = var.create_instance_profile ? 1 : 0
  name  = var.iam_instance_profile_name
  role  = aws_iam_role.iam_role.name
  tags  = local.tags
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  for_each   = toset(var.policy_list) 
  role       = aws_iam_role.iam_role.name
  policy_arn = each.value
}