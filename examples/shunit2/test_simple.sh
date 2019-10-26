#!/usr/bin/env bash
# shellcheck disable=SC1091,SC2164,SC2154,SC2155,SC2103

. shunit2/test_helper.sh

vars=(
  AWS_ACCOUNT_ID
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
)
validateVars

testSimple() {
  cd simple

  if ! terraform apply -auto-approve ; then
    fail "terraform did not apply"
    startSkipping
  fi

  cd ..
}

testLimit() {
  read -r amount unit <<< "$(
    aws budgets describe-budgets --account-id "$AWS_ACCOUNT_ID" \
      --query 'Budgets[0].BudgetLimit.[Amount, Unit]' --output text
  )"
  assertEquals "unexpected budget limit amount" "100.0" "$amount"
  assertEquals "unexpected budget limit unit" "USD" "$unit"
}

testSubscriber() {
  read -r subscription_type address <<< "$(
    aws budgets describe-subscribers-for-notification --account-id "$AWS_ACCOUNT_ID" \
      --budget-name budget --notification 'NotificationType=FORECASTED,ComparisonOperator=GREATER_THAN,Threshold=100.0' \
      --query 'Subscribers[].[SubscriptionType, Address]' --output text
  )"
  assertEquals "unexpected subscription type" "EMAIL" "$subscription_type"
  assertEquals "unexpected email address" "alex@example.com" "$address"
}

oneTimeTearDown() {
  if [ "$NO_TEARDOWN" != "true" ] ; then
    cd simple
    terraform destroy -auto-approve
    cd ..
  fi
}

. shunit2
