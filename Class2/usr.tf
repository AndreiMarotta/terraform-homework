resource "aws_iam_user" "usr" {
  for_each = toset(["jenny", "rose", "lisa", "jisoo"])
  name = each.key
}

resource "aws_iam_group" "group1" {
  name = "blackpink"
}

resource "aws_iam_group_membership" "team1" {
  name  = "blackpink-membership"
  users = [
    for i in aws_iam_user.usr : i.name
  ]
  group = aws_iam_group.group1.name
}