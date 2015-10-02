Feature: 14481 - User login for app
  As a user
  I want to have user authentication
  So that only I have access to my account

#Background:
Scenario: test launch
  Given I launch the app
  Then I should see the "androidDemo" page

#  @APPROVEDANDROID
#Scenario: Login page with enabled or disabled buttons
#  Then I should see an empty "username" textfield
#  And I should see an empty "password" textfield
#  And I should see a disabled "Login" button
#  When I enter "abc" for "username"
#  Then I should see a disabled "Login" button
#  When I enter "123" for "password"
#  Then I should see an enabled "Login" button
#  When I enter "" for "username"
#  Then I should see a disabled "Login" button


#  @APPROVEDANDROID
#Scenario: Successful login
#  When I enter valid user credentials
#  And I select the "Submit" button
#  Then I should see the "Home" page

#  @APPROVEDANDROID
#Scenario Outline: Unsuccessful Login
#  When I enter a <username> username for "username"
#  And I enter <password> password for "password"
#  And I select the "Submit" button
#  Then I should see an error message "Please enter correct username and password"

#  Examples:
#    | username | password |
#    | valid    | invalid  |
#    | invalid  | valid    |
#    | invalid  | invalid  |


