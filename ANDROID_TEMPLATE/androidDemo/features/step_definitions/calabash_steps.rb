require 'calabash-android/calabash_steps'

Given(/^I launch the app$/) do
  element_exists("androidDemo")
end

Then(/^I should see the "(.*?)" page$/) do |arg1|
  element_exists(arg1) # express the regexp above with the code you wish you had
end
