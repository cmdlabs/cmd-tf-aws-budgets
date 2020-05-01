module "budgets" {
  source                           = "../"
  enable_savings_plan_budget       = false
  enable_ri_rds_utilization_budget = false
  enable_ri_ec2_utilization_budget = true

  enable_actual_cost_budget         = true
  enable_forecast_cost_budget       = true
  limit_amount                      = 100
  limit_unit                        = "USD"
  direct_subscriber_email_addresses = ["adam.durbin@cmd.com.au"]

}
