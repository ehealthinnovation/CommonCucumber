# This is the main template file containing all feature interactions# This is the main template file containing all feature interactions# This is the main template file containing all feature interactions

INTERACTIONS:

Button:
check if button exists
	I should see a "<label>" button <context> "<value>"
	Examples:
	| context |
	| in section |
	| with id | #id format: page-section-description
	eg: I should see a "Confirm" button with id "profile-form-confirm"
	      I should see a "Confirm" button in section "profile-form"

click a button
I select the "<label>" button <context> <value>"
I click on the "<label>" button <context> "<value>"
	Examples:
	| context |
	| in section |
	| with id | #id format: page-section-description
	eg: I select the "Confirm" button with id "profile-form-confirm"
	      I click on the "Confirm" button with id "profile-form-confirm"

check if disabled/enabled
I should see the "<label>" button <context> "<value>" is enabled|disabled
	Examples:
	| context |
	| in section |
	| with id | #id format: page-section-description
	eg: I should see the "Confirm" button with id "profile-form-confirm" is enabled
	      I should see the "Confirm" button in section "profile-form" is disabled

check style(color)
I should see the "<label>" button <context> "<value>" has <style> "<style_value>"
	Examples:
	| context | style |
	| in section | color |
	| with id | opacity | 
#id format: page-section-description
	eg: I should see the "Confirm" button with id "profile-form-confirm" has color "green"


Text:
check if text exists ( I should see )
I should <visibility> "<string>"
Examples: 
|visibility|
| see |
| not see |
eg: I should not see "Today is Monday" 

click on text
I click on the "<label>" text 
	eg: I click on the "Confirm" text 

text position check
I should see  <string>" <position> "<string>"
Examples: 
| position | 
| preceding | 
| following | 
eg. I should see "hello" preceding "how are you"

# Textbox
# Enter text in "x" box with "id"
# Delete text
# Check for style(error bars)
# Check for disabled/enabled
# Dropdown
# Date of birth
# select y from x dropdown
# Navigation
# Check for page you’re on
# Image
# check if icon exists
# check for image
# click on image
# image disabled/enabled
# Menu navigation
# Check for elements
# open menu
# close menu
# click on menu option
# Checkbox/Radio button
# Enabled
# Disabled
# select
# unselect
# Slider
# current value
# increase
# decrease
# Dialog boxes
# dialog box shown
# dialog box hidden
# Lists
# Should see "x" in "y" row "z" column
# number of elements
# Page scroll
# Scroll up
# Scroll down
# Elements (eg: alert icon)
# Check if elements exist
# check if elements don’t exist


# Meeting minutes:
# Dropdown
# if exist
# count of the list
# Cross reference elements with designer
# Automated quality assurance for user story

# NOTE: Above interactions are focused primarily on user interaction with the system. These don’t cover @manual scenarios and server functionality testing. 


# IDEAS: 
# We could possibly extract out the function into a template as well (like selecting, clicking etc). One drawback would be that this would lead to a big test function. We are thinking if an efficient way of doing this, via a hash-map or other structures would give almost original performance.
# Plugin for text-editors (Sublime) to enable autocomplete. eg: type button , hit tab, displays list of all button related functionality for the person writing the feature file. 
