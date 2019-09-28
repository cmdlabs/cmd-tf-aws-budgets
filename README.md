<!-- vim: set ft=markdown: -->
![CMD Solutions](https://s3-ap-southeast-2.amazonaws.com/cmd-website-images/CMDlogo.jpg)

# terraform-aws-budgets

#### Table of contents

1. [Overview](#overview)
2. [AWS Budgets](#aws-budgets)
    * [Resources docs](#resources-docs)
    * [Inputs](#inputs)
    * [Example](#example)
3. [License](#license)

## Overview

A Terraform module to deploy custom AWS budgets. It is used to resource create, replace, or delete budgets for Billing and Cost Management. For more information, see [Managing Your Costs with Budgets](https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/budgets-managing-costs.html) in the AWS Billing and Cost Management User Guide.

Terraform >= 0.12.0 is required for this module.

## AWS Budgets

### Resources docs

AWS Budgets automation includes the use of the following core Terraform resources:

- [`aws_budgets_budget`](https://www.terraform.io/docs/providers/aws/r/budgets_budget.html) - Provides a budgets budget resource.

### Inputs

The below outlines the current parameters and defaults.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
|limit_amount|The budget limit amount|number|""|No|
|limit_unit|The budget limit unit. Default is USD|string|USD|No|
|subscriber_email_addresses|The list of email addresses of notification subscribers|list(string)|[]|No|

### Example

A simple example:

```tf
module "budgets" {
  source                     = "git@github.com:cmdlabs/terraform-aws-budgets.git"
  limit_amount               = 100
  limit_unit                 = "USD"
  subscriber_email_addresses = ["alex@example.com"]
}
```

To apply that:

```text
▶ terraform apply
```

## License

Apache 2.0.
