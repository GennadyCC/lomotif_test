Given(/^I go to LogIn screen$/) do
  find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '4']").click
end

When(/^I tap the SignUp\/LogIn button$/) do
  find_element(id: "action_social").click
end

Then(/^I tap LogIn link$/) do
  find_element(id: "action_login").click
end

Then(/^I provide "([^"]*)" and "([^"]*)"$/) do |email, pass|
  find_element(id: "field_mail").send_keys(email)
  find_element(id: "field_password").send_keys(pass)
  @driver.hide_keyboard
end

And(/^I tap LogIn button$/) do
  find_element(xpath: "//android.widget.Button[@index = '4']").click
  sleep 5
end

Then(/^I can see "([^"]*)" on top of the screen$/) do |username|
  make_screenshot("login")
  sleep 1
end

And(/^I tap Sign up link$/) do
  pending
end

Then(/^I I provide "([^"]*)", "([^"]*)" and "([^"]*)"$/) do |email, password, username|
  pending
end

And(/^I tap the Sign up button$/) do
  pending
end