resource "aws_iam_user" "hw1_usr1" {
  name = "jenny"
}

resource "aws_iam_user" "hw1_usr2" {
  name = "rose"
}

resource "aws_iam_user" "hw1_usr3" {
  name = "lisa"
}

resource "aws_iam_user" "hw1_usr4" {
  name = "jiso"
}

resource "aws_iam_user" "hw1_usr5" {
  name = "jihyo"
}

resource "aws_iam_user" "hw1_usr6" {
  name = "sana"
}

resource "aws_iam_user" "hw1_usr7" {
  name = "momo"
}

resource "aws_iam_user" "hw1_usr8" {
  name = "dahyun"
}

resource "aws_iam_group" "group1" {
  name = "blackpink"
}

resource "aws_iam_group" "group2" {
  name = "twice"
}

resource "aws_iam_group_membership" "team1" {
  name = "blackpink-membership"

  users = [
    aws_iam_user.hw1_usr1.name,
    aws_iam_user.hw1_usr2.name,
    aws_iam_user.hw1_usr3.name,
    aws_iam_user.hw1_usr4.name,
  ]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "team2" {
  name = "twice-membership"

  users = [
    aws_iam_user.hw1_usr5.name,
    aws_iam_user.hw1_usr6.name,
    aws_iam_user.hw1_usr7.name,
    aws_iam_user.hw1_usr8.name,
  ]

  group = aws_iam_group.group2.name
}

#new user miyeon & mina import from AIM
#terraform import aws_iam_user.hw1_usr9 miyeon
#terraform import aws_iam_user.hw1_usr10 mina
resource "aws_iam_user" "hw1_usr9" {     
  name = "miyeon"
}
resource "aws_iam_user" "hw1_usr10" {     
  name = "mina" 
}

resource "aws_iam_group_membership" "team3" {
  name = "blackpink-membership"

  users = [
    aws_iam_user.hw1_usr9.name,
  ]

  group = aws_iam_group.group1.name
}

resource "aws_iam_group_membership" "team4" {
  name = "twice-membership"

  users = [
    aws_iam_user.hw1_usr10.name,
  ]

  group = aws_iam_group.group2.name
}