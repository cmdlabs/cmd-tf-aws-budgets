module "budgets" {
  source                            = "github.com/cmdlabs/tf-modules/cmd-tf-aws-budgets?ref=0.2.0"
  limit_amount                      = 100
  limit_unit                        = "USD"
  direct_subscriber_email_addresses = ["alex@example.com"]
}