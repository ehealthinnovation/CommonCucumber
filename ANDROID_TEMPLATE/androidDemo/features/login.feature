Feature: 14481 - User login for app
  As a user
  I want to have user authentication
  So that only I have access to my account

#Background:
Scenario: Test app launch
  	Given I launch the app
  	Then I should see the "androidDemo" page
  	And I should see the "Submit" button with id "main_submit_button"
  	And I should see the "Username" text
  	And I should see the "Password" text
  	And I should see the textbox with id "main_username_edittext"
  	And I should see the textbox with id "main_password_edittext"
  	And I should not see the text with id "main_error_text"

@APPROVEDANDROID
Scenario: Successful login
  	When I enter "test" in the textbox with id "main_username_edittext"
  	And I enter "test" in the textbox with id "main_password_edittext"
  	And I click on the "Submit" button with id "main_submit_button"
  	Then I should see the "Home" page
  	And I should see the "Welcome" text

@APPROVEDANDROID
Scenario: Unsuccessful Login
  	When I enter "tes" in the textbox with id "main_username_edittext"
  	And I enter "tes" in the textbox with id "main_password_edittext"
  	And I click on the "Submit" button with id "main_submit_button"
  	Then I should see the "Please enter the correct username and password" text




