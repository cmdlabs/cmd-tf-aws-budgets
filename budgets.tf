resource "aws_budgets_budget" "actual_cost_budget" {
  count = var.enable_actual_cost_budget ? 1 : 0
  name  = var.actual_cost_budget_name

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
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}

resource "aws_budgets_budget" "forecast_cost_budget" {
  count = var.enable_forecast_cost_budget ? 1 : 0
  name  = var.forecast_cost_budget_name

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
    notification_type          = "FORECASTED"
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}

resource "aws_budgets_budget" "ec2_ri_utilization" {
  count = var.enable_ri_ec2_utilization_budget ? 1 : 0

  name              = "EC2 RI UTILIZATION BUDGET"
  budget_type       = "RI_UTILIZATION"
  limit_amount      = "100.0" # RI utilization must be 100
  limit_unit        = "PERCENTAGE"
  time_period_end   = var.time_period_end
  time_period_start = var.time_period_start
  time_unit         = var.time_unit
  cost_types {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
    include_recurring          = false
    include_refund             = false
    include_subscription       = true
    include_support            = false
    include_tax                = false
    include_upfront            = false
    use_blended                = false
  }

  cost_filters = {
    Service = "Amazon Elastic Compute Cloud - Compute"
  }

  notification {
    comparison_operator        = "LESS_THAN"
    threshold                  = "100"
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}

resource "aws_budgets_budget" "rds_ri_utilization" {
  count = var.enable_ri_rds_utilization_budget ? 1 : 0

  name              = "RDS RI UTILIZATION BUDGET"
  budget_type       = "RI_UTILIZATION"
  limit_amount      = "100.0" # RI utilization must be 100
  limit_unit        = "PERCENTAGE"
  time_period_end   = var.time_period_end
  time_period_start = var.time_period_start
  time_unit         = var.time_unit
  cost_types {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
    include_recurring          = false
    include_refund             = false
    include_subscription       = true
    include_support            = false
    include_tax                = false
    include_upfront            = false
    use_blended                = false
  }

  cost_filters = {
    Service = "Amazon Relational Database Service"
  }

  notification {
    comparison_operator        = "LESS_THAN"
    threshold                  = "100"
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}

resource "aws_budgets_budget" "savings_plan_utilization" {
  count = var.enable_savings_plan_budget ? 1 : 0

  name              = "SAVINGS PLAN UTILIZATION BUDGET"
  budget_type       = "SAVINGS_PLANS_UTILIZATION"
  limit_amount      = "100.0"
  limit_unit        = "PERCENTAGE"
  time_period_end   = var.time_period_end
  time_period_start = var.time_period_start
  time_unit         = var.time_unit
  cost_types {
    include_credit             = false
    include_discount           = false
    include_other_subscription = false
    include_recurring          = false
    include_refund             = false
    include_subscription       = true
    include_support            = false
    include_tax                = false
    include_upfront            = false
    use_blended                = false
  }

  notification {
    comparison_operator        = "LESS_THAN"
    threshold                  = "100"
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = var.direct_subscriber_email_addresses
    subscriber_sns_topic_arns  = [aws_sns_topic.budgets_topic.arn]
  }
}
