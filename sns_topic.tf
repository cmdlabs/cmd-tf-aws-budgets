resource "aws_sns_topic" "budgets_topic" {
  name = "sns_budget_topic_with_policy"
}

resource "aws_sns_topic_policy" "default" {
  arn    = aws_sns_topic.budgets_topic.arn
  policy = data.aws_iam_policy_document.sns_topic_policy.json
}
