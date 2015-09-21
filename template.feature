# This is the main template file containing all feature interactions# This is the main template file containing all feature interactions# This is the main template file containing all feature interactions

INTERACTIONS:

Button:
check if button exists
	I should see a "<label>" button <context> "<value>"
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I should see a "Confirm" button with id "profile-form-confirm"
	I should see a "Confirm" button in section "profile-form"

click a button
I select the "<label>" button <context> "<value>"
I click on the "<label>" button <context> "<value>"
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I select the "Confirm" button with id "profile-form-confirm"
	I click on the "Confirm" button with id "profile-form-confirm"

check if disabled/enabled
I should see the "<label>" button <context> "<value>" is enabled|disabled
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I should see the "Confirm" button with id "profile-form-confirm" is enabled
	I should see the "Confirm" button in section "profile-form" is disabled

check style(color)
I should see the "<label>" button <context> "<value>" has <style> "<style_value>"
	Examples:
	| context    | style   |
	| in section | color   |
	| with id    | opacity |
#id format: page-section-description
	eg: I should see the "Confirm" button with id "profile-form-confirm" has color "green"


Text:
check if text exists ( I should see )
I should <visibility> "<string>"
	Examples:
	| visibility |
	| see        |
	| not see    |
eg: I should not see "Today is Monday"

click on text
I click on the "<label>" text
	eg: I click on the "Confirm" text

text position check
I should see "<string>" <position> "<string>"
	Examples:
	| position  |
	| preceding |
	| following |
eg. I should see "hello" preceding "how are you"


Textbox:
Enter/Delete text in textbox
I enter "<string>" in "<textbox_name>" <context> "<value>"
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I enter "ehealthuser1" in "username" textbox with id "profile-form-username"
	eg: I enter "" in "username" textbox with id "profile-form-username"

Check for style(error bars)
the "<textbox_name>" textbox <context> has style "<value>"
	eg. the "Password" textbox with id "password-setup-page" has style "invalid"

Check for disabled/enabled
I should see the "<textbox_name>" textbox <context> "<value>" is enabled|disabled

Check if textbox exist
I should see the "<textbox_name>" textbox <context> "<value>"

Dropdown:
Select y from x dropdown
I select "<string>" from dropdown <context> "<value>"
	Examples:
	| context    |
	| in section |
	| with id    |
	eg. I select "1990" from dropdown with id "profile-form-birth-year"

Navigation:
Check for page you’re on
I should be on page "<string>"
	eg. I should be on page "home"

Image:
Check if image exists
I should <visibility> an image <context> "<value>" 
	Examples:
	| visibility | context    |
	| see        | in section | 
	| not see    | with id    |
	eg. I should see an image with id "profile-image"

Click on image
I click on the image <context> "<value>"
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I click on the image with id "profile-image"

Image disabled/enabled
I should see the image <context> "<value>" is enabled|disabled
	Examples:
	| context    |
	| in section |
	| with id    |
	eg: I should see the image with id "profile-image" is enabled

#Menu navigation:
# Check for elements
# open menu
# close menu
# click on menu option

# Checkbox/Radio button
# Enabled
# Disabled
# select
# unselect
Slider:
current value
I see the "<slider_name>" slider <context> "<value>" has value "<value>"

increase/decrease
I <option> the "<slider_name>" slider <context> "<value>"'s value to "<value>"

Examples:
	| context    | option   |
	| in section | increase |
	| with id    | decrease |
	eg. I see the "rating" slider with id "rating-slider" has value "4"
	eg. I increase the "rating" slider with id "rating-slider"'s value to "10"

# Dialog boxes
# dialog box shown
# dialog box hidden

Lists:
Visibility: 	
I should <visibility> a list item labelled "<string>"	
Examples: 
	| visibility |
	| see        |
	| not see    |
	eg. I should see a list item labelled "Health levels"

Check for values: 
I should <visibility> <selector> "<value>" on the list item labelled "<name>"
Examples: 
	| visibility | selector |
	| see        | flag     |
	| not see    | text     | 
	# selectors depend on project - usually can be mapped to classes
	eg. I should see flag "overdue" on the list item labelled "Feedback"
		I should not see text "unhealthy" on the list item labelled "Health levels"

Page scroll:
Scroll up
I scroll to the <option> of the page

Examples: 
	| option |
	| top    |
	| bottom |
	eg. I scroll to the top of the page

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
