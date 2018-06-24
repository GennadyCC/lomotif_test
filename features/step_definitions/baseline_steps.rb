Given(/^I open Add Photo & Video screen$/) do
  sleep 10
  find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '2']").click
end

Then(/^I find "([^"]*)" folder$/) do |folder_name|
  sleep 10
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

  sleep 1
end

Then(/^I select first song$/) do
  find_element(xpath: "//android.support.v7.widget.RecyclerView/android.widget.RelativeLayout/android.widget.ImageView[1]").click
  sleep 1
end

And(/^I go to the next screen$/) do
  find_element(id: "icon_action_next").click
  sleep 15
end

Then(/^I establish duration "([^"]*)" sec\. from max\. 30s to min\. 3s$/) do |target|

  swipe(start_x: 0.5, start_y: 0.99, end_x: 0.2, end_y: 0.3, duration: 800).perform
  # Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.99, end_x: 0.2, end_y: 0.3, duration: 800).perform

  sleep 2
  check_pop_up("Skip")
  i = 0
  until exists{find_element(id: "slider_duration")} || (i > 5) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.7, end_x: 0.5, end_y: 0.9, duration: 800).perform
    sleep 1
    i += 1
    check_pop_up("Skip")
  end

  # binding.pry
  check_pop_up("Skip")
  x_scroll_start = (find_element(id: "slider_duration").location)[0]
  y_scroll = (find_element(id: "slider_duration").location)[1]
  x_scroll_width = (find_element(id: "slider_duration").size)[0]
  scroll_hight = (find_element(id: "slider_duration").size)[1]
  x_scroll = target.to_f / 30 * x_scroll_width + x_scroll_start - 1
  x_scroll = x_scroll.round
  y_scroll = y_scroll + scroll_hight / 2
  Appium::TouchAction.new.tap(x: x_scroll.to_s, y: y_scroll.to_s, count: 1).perform

end

When(/^I tap Export icon$/) do
  check_pop_up("Skip")
  find_element(id: "icon_action_export").click

end

Then(/^I confirm that I want to export my project$/) do
  check_pop_up("Skip")
  find_element(id: "button1").click
end

Then(/^I tap to Show me my Lomotif button$/) do
  text("Show me my Lomotif!").click
end

And(/^I select the last Lomotif project$/) do
  make_screenshot("base_1")
end


Then(/^I close application$/) do
  @driver.close_app
end