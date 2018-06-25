Given(/^I go to LogIn screen$/) do
  find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '4']").click
end

When(/^I tap the SignUp\/LogIn button$/) do
  find_element(id: "action_social").click
end

Then(/^I tap LogIn link$/) do
  find_element(id: "action_login").click
end

Then(/^I provide "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |unique, email, pass|
  find_element(id: "field_mail").send_keys(email+unique)
  find_element(id: "field_password").send_keys(pass+unique)
  if is_keyboard_shown
    hide_keyboard
  end
end

And(/^I tap LogIn button$/) do
  find_element(xpath: "//android.widget.Button[@index = '4']").click
  sleep 5
end

Then(/^I can see "([^"]*)" on top of the screen$/) do |username|
  sleep 5
  # binding.pry
  if exists{text("Oops, this username is taken. Try something else?")}
      message = find_element(id: "message").text
      p message
      fail("ERROR: message #{message}")
      make_screenshot("login_fail")
  else
    # binding.pry
    sleep 5
      if !exists{text(username)}
          fail("element #{username} does not exists")
          make_screenshot("login_fail")
      end
  end
end

And(/^I tap Sign up link$/) do
  find_element(id: "action_signup").click
end

Then(/^I provide "([^"]*)" "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |unique, email, password, username|
  find_element(id: "field_mail").send_keys(email+unique)
  find_element(id: "field_username").send_keys(username+unique)
  find_element(id: "field_password").send_keys(password+unique)
end

Then(/^I provide "([^"]*)" "([^"]*)" and "([^"]*)" "([^"]*)"$/) do |unique_1, email, unique_2, password| ########
  find_element(id: "field_mail").send_keys(email+unique_1)
  find_element(id: "field_password").send_keys(password+unique_2)
end

And(/^I tap the Sign up button$/) do
  if is_keyboard_shown
    hide_keyboard
  end
  find_element(xpath: "//android.widget.Button[@text = 'Sign up']").click
end

Then(/^I can see message "([^"]*)"$/) do |message|
  sleep 5
  if !exists{text(message)}
    fail("No error message #{username}")
  end
end

# Email
Then(/^I try to provide emails with invalid format and see message "([^"]*)"$/) do |error_message|
print_message = "User can use Incorrect email format " #message as error
screenshot_name = "email" # name for screenshot file
data_list = $incorrect_email
test_type = "negative"

  if validation(test_type, "email", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end


Then(/^I provide email with valid format and see message "([^"]*)"$/) do |error_message|
  print_message = "User cannot use Correct email format " #message as error
  screenshot_name = "email" # name for screenshot file
  data_list = $correct_email
  test_type = "positive"

  if validation(test_type,"email", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end

#Username
Then(/^I provide username with invalid format and see message with word "([^"]*)"$/) do |error_message|
  print_message = "User can use Incorrect username format " #message as error
  screenshot_name = "username" # name for screenshot file
  data_list = $incorrect_username
  test_type = "negative"

  if validation(test_type,"username", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end

Then(/^I provide username with valid format and see message "([^"]*)"$/) do |error_message|
  print_message = "User cannot use Correct username format " #message as error
  screenshot_name = "username" # name for screenshot file
  data_list = $correct_username
  test_type = "positive"

  if validation(test_type,"username", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end

Then(/^I provide password with invalid format and see message "([^"]*)"$/) do |error_message|
  print_message = "User can use Inorrect password format " #message as error
  screenshot_name = "password" # name for screenshot file
  data_list = $incorrect_password
  test_type = "negative"

  if validation(test_type,"password", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end

Then(/^I provide password with valid format and there is no error message "([^"]*)"$/) do |error_message|
  print_message = "User cannot use Correct password format " #message as error
  screenshot_name = "password" # name for screenshot file
  data_list = $correct_password
  test_type = "positive"

  if validation(test_type,"password", data_list, error_message, print_message, screenshot_name) == 1
    fail("ERROR: #{print_message} #{$errors_collection}")
  end
end


