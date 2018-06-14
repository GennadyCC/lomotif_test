Given(/^I open Add Photo & Video screen$/) do
  find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '2']").click
end

Then(/^I find "([^"]*)" folder$/) do |folder_name|
  text(folder_name).click
end

And(/^I select first "([^"]*)" files$/) do |file_num|
  sleep 1
  i = 1
  while i <= file_num.to_i do
    # find_element(xpath: "//android.support.v7.widget.RecyclerView/android.widget.RelativeLayout[#{i}]/android.widget.RelativeLayout/android.widget.ImageView").click
    find_element(id: "grid_media").find_element(xpath: "//android.widget.RelativeLayout[#{i}]").find_element(xpath: "//android.widget.RelativeLayout").find_element(xpath: "//android.widget.ImageView").click
    i += 1
  end
  sleep 1
end


Then(/^I go to the add sound screen$/) do
  find_element(id: "icon_action_next").click
  # if text("Are you sure you want to proceed without adding music?")
  #   find_element(id: "button2").click
  # end
end

When(/^I find music "([^"]*)"$/) do |song|
  find_element(id: "fieldSearch").click
  find_element(id: "fieldSearch").send_keys(song)
  Appium::TouchAction.new.tap(x: 0.99, y: 0.99, count: 1).perform

end

Then(/^I select first song$/) do
  find_element(xpath: "//android.support.v7.widget.RecyclerView/android.widget.RelativeLayout/android.widget.ImageView[1]").click
  sleep 1
end

And(/^I go to the next screen$/) do
  find_element(id: "icon_action_next").click
  sleep 15
end

Then(/^I establish duration 15s$/) do
  # find_element(id: "slider_duration").send_keys(10)
  # sleep 15
end

When(/^I tap Export icon$/) do
  find_element(id: "icon_action_export").click
end

Then(/^I confirm that I want to export my project$/) do
  find_element(id: "button1").click
end

Then(/^I tap to Show me my Lomotif button$/) do
  text("Show me my Lomotif!").click
end

And(/^I select the last Lomotif project$/) do
  puts("sreenshot")
  make_screenshot("final")
end

