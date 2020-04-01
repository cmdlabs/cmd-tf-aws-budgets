module "budgets" {
  source                            = "../"
  limit_amount                      = 100
  limit_unit                        = "USD"
  direct_subscriber_email_addresses = ["alex@example.com"]
}
