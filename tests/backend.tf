terraform {
  backend "s3" {

    bucket                  = "cmdlabtf-terraform-backend"
    key                     = "module-cmd-tf-aws-budgets"
    region                  = "ap-southeast-2"
    profile                 = "cmdlabtf-tfbackend"
    dynamodb_table          = "cmdlabtf-terraform-lock"
    skip_metadata_api_check = true

    # Uncomment to utilise local testing in CMD Sandpit
    # bucket                  = "cmdlab-sandpit2-terraform-backend"
    # key                     = "module-cmd-tf-aws-budgets"
    # region                  = "ap-southeast-2"
    # profile                 = "idp-sandpit2"
    # dynamodb_table          = "cmdlab-tf-terraform-lock"
    # skip_metadata_api_check = true
  }
}
