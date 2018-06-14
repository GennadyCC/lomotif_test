Given(/^I go to LogIn screen$/) do
  puts("I tap User icon")
  find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '4']").click
end

When(/^I tap the SignUp\/LogIn button$/) do
  puts("I tap SignUp button")
  find_element(id: "action_social").click
end

Then(/^I tap LogIn link$/) do
  puts("I tap LogIn link")
  find_element(id: "action_login").click
end

Then(/^I provide "([^"]*)" and "([^"]*)"$/) do |email, pass|
  puts("I provide #{email} and #{pass}")
  find_element(id: "field_mail").send_keys(email)
  find_element(id: "field_password").send_keys(pass)
  @driver.hide_keyboard
end

And(/^I tap LogIn button$/) do
  puts("I tap LogIn button")
  find_element(xpath: "//android.widget.Button[@index = '4']").click
  sleep 5
end

Then(/^I can see "([^"]*)" on top of the screen$/) do |username|
  puts("I can see #{username} on the screen")
  sleep 15

end