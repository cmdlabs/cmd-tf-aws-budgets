resource "aws_budgets_budget" "budget" {
  name              = "Initial terraform budget"
  budget_type       = "COST"
  limit_amount      = var.limit_amount
  limit_unit        = var.limit_unit
  time_period_end   = var.time_period_end
  time_period_start = var.time_period_start
  time_unit         = var.time_unit

  notification {
    comparison_operator        = var.comparison_operator
    threshold                  = var.threshold
    threshold_type             = var.threshold_type
    notification_type          = var.notification_type
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}
