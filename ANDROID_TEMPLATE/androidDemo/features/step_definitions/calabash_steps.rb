require 'calabash-android/calabash_steps'

Given(/^I launch the app$/) do
  element_exists("androidDemo")
end

Then(/^I should see the "(.*?)" page$/) do |label|
  element_exists(label) 
end

Then(/^I should see the "(.*?)" button$/) do |label|
  
end

Then(/^I should see the "(.*?)" text$/) do |label|
  element_exists(label) 
end

Then(/^I should see the textbox with id "(.*?)"$/) do |id|
  element_exists(id) 
end

Then(/^I should not see the text with id "(.*?)"$/) do |id|
  element_does_not_exist(id) # express the regexp above with the code you wish you had
end

When(/^I enter "(.*?)" in the textbox with id "(.*?)"$/) do |arg1, arg2|
  	clear_text_in("android.support.v7.widget.AppCompatEditText id:'#{arg2}'")
  	enter_text("android.support.v7.widget.AppCompatEditText id:'#{arg2}'", arg1)

	hide_soft_keyboard()
	sleep 2
end

When(/^I click on the "(.*?)" button with id "(.*?)"$/) do |arg1, arg2|
    hide_soft_keyboard()
  	touch(query("* text:'#{arg1}' id:'#{arg2}'"))
  	sleep 5
end

Then(/^I should see the "(.*?)" button with id "(.*?)"$/) do |arg1, arg2|
  element_exists("* text:'#{arg1}' id:'#{arg2}'") 
end



