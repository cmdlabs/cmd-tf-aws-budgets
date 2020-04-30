module "budgets" {
  source                            = "github.com/cmdlabs/tf-modules/cmd-tf-aws-budgets?ref=0.2.0"

  enable__actual_cost_budget        = false
  enable_forecast_cost_budget       = true
  limit_amount                      = 100
  limit_unit                        = "USD"
  direct_subscriber_email_addresses = ["email.address@example.com"]

  enable_savings_plan_budget        = true
  enable_ri_rds_utilization_budget  = true
  enable_ri_ec2_utilization_budget  = true  
}