
Then /^I login as "(.*?)"/ do |name|
  # allow time for modal to be displayed
  wait_for(:timeout => 30) { element_exists("textField") }
  step "I enter \"#{name}\" for \"username\""
  step 'I enter "pass" for "password"'
  step "I select the \"Login\" button"
end

When(/^I enter valid user credentials$/) do
  step "I enter \"Patty\" for \"username\""
  step 'I enter "pass" for "password"'
end

Given(/^I login$/) do
  step 'I login as "Patty"'
  sleep 10
end

Given(/^I log out$/) do
  step "I should see the \"Home\" page"
  # need a delay before button can be clicked
  sleep 1
  step "I select the \"Log Out\" button"
end

When(/^I enter a (valid|invalid) username for "username"$/) do |valid|
  username = "Patty"
  username = "baduser" if valid == 'invalid'
  step "I enter \"#{username}\" for \"username\""
end

When(/^I enter (valid|invalid) password for "password"$/) do |valid|
  password = "pass"
  password = "badpass" if valid == 'invalid'
  step "I enter \"#{password}\" for \"password\""
end
