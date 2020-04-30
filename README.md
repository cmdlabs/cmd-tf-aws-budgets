<!-- vim: set ft=markdown: -->
![CMD Solutions|medium](https://s3-ap-southeast-2.amazonaws.com/cmd-website-images/CMDlogo.jpg)

# terraform-aws-budgets

This module handles the deployment of opinionated budgets with notifications. The budgets are opinionated to provide simplicity of management and consistency of alerting.

Budgets supported include:

- Forecasted Budget
- Actual Budget
- 100% Utilization of Savings Plans
- 100% Utilization of EC2 Reserved Instances
- 100% Utilization of RDS Reserved Instances

## Table of contents

1. [Overview](#overview)
2. [AWS Budgets](#aws-budgets)
    * [Resources docs](#resources-docs)
    * [Inputs](#inputs)
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
|enable_ri_ec2_utilization_budget|Flag to enable monitoring of 100% utilization of EC2 RIs in account|boolean|false|No|
|enable_ri_rds_utilization_budget|Flag to enable monitoring of 100% utilization of RDS RIs in account|boolean|false|No|
|enable_savings_plan_budget|Flag to enable monitoring of 100% utilization of Savings Plans in account|boolean|false|No|
|enable_actual_cost_budget|Flag to enable Actual budget amount (limit set in `limit_amount`)|boolean|false|No|
|enable_forecast_cost_budget|Flag to enable Forecasted budget amount (limit set in `limit_amount`)|boolean|false|No|
|limit_amount|The budget limit amount|number|""|Yes|
|limit_unit|The budget limit unit. Default is USD|string|USD|No|
|direct_subscriber_email_addresses|The list of email addresses of direct notification subscribers. This bypasses SNS Topic|list(string)|[]|No|
|time_period_start|The start of the time period covered by the budget|string|2017-07-01_00:00|No|
|time_period_end|The end of the time period covered by the budget|string|2087-06-15_00:00|No|
|time_unit|The length of time until a budget resets the actual and forecasted spend. Valid values: MONTHLY, QUARTERLY, ANNUALLY|string|MONTHLY|No|
|comparison_operator|Comparison operator to use to evaluate the condition. Can be LESS_THAN, EQUAL_TO or GREATER_THAN|string|GREATER_THAN|No|
|threshold|Threshold when the notification should be sent|number|100|No|
|threshold_type|What kind of threshold is defined. Can be PERCENTAGE OR ABSOLUTE_VALUE|string|PERCENTAGE|No|
|notification_type|What kind of budget value to notify on. Can be ACTUAL or FORECASTED|string|FORECASTED|No|

## License

Apache 2.0.
