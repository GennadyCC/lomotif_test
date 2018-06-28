require "appium_lib"
require "pry"


def caps
  { caps: {
      deviceName: "Android",
      platformName: "Android",
      # app: (File.join(File.dirname(__FILE__), "com.lomotif.android-v2.2.7.apk")),
      appPackage: "com.lomotif.android",
      appActivity: "com.lomotif.android.view.LMLauncherActivity",
      newCommandTimeout: "3600"
   }}
end

Appium::Driver.new(caps,true)
Appium.promote_appium_methods Object


def make_screenshot(text)
  if File.directory?("screenshots")
    # puts("ok")
  else
    FileUtils.mkdir_p("screenshots")
    # puts("create folder")
  end

  time_stamp = Time.now.strftime(text + "-" + "%Y-%m-%d_%H.%M.%S")
  screenshot_name = time_stamp + ".png"
  screenshot_file = File.join("screenshots", screenshot_name)
  $driver.screenshot(screenshot_file)
  embed("#{screenshot_file}", "image/png")
end

def check_pop_up(text)
  if exists{text(text)}
    text("Skip").click
  end
end


def validation(test_type, field, list_name, popup_message, print_message, screenshot_name)
  if field == "email"
    target_field = "field_mail" # path to email field
  end
  if field == "username"
    find_element(id: "field_mail").send_keys("example@domain.com")
    target_field = "field_username" # path to username field
  end
  if field == "password"
    target_field = "field_password" # path to username field
  end

  $errors_collection.clear

  i = list_name.length
  b = 0
  error_status = 0

  while b < i do

    if field != "password"
      find_element(id: target_field).send_keys(list_name[b])
      if is_keyboard_shown
        hide_keyboard
      end
        find_element(xpath: "//android.widget.Button[@text = 'Sign up']").click
        if !exists{text(popup_message)}
          error_status = 1
          $errors_collection.push(list_name[b])
          p "ERROR: #{print_message} #{list_name[b]}"
          make_screenshot("#{screenshot_name}")
        end
        find_element(id: "button1").click
        find_element(id: target_field).clear
    end


    if field == "password"
      email_address = Time.now.strftime("test" + "_%Y%m%d%H%M%S"+"@domain.com")
      test_username = Time.now.strftime("test" + "%Y%m%d%H%M%S")
      find_element(id: "field_mail").clear
      find_element(id: "field_mail").send_keys(email_address)
      find_element(id: "field_username").clear
      find_element(id: "field_username").send_keys(test_username)
      find_element(id: target_field).clear
      find_element(id: target_field).send_keys(list_name[b])
      if is_keyboard_shown
        hide_keyboard
      end

      find_element(xpath: "//android.widget.Button[@text = 'Sign up']").click
      if test_type == "negative"
        if exists{text(popup_message)}
          find_element(id: "button1").click
        else
          error_status = 1
          $errors_collection.push(list_name[b])
          p "ERROR: #{print_message} #{list_name[b]}"
          make_screenshot("#{screenshot_name}")
          find_element(id: "action_settings").click
          sleep 3
          Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.9, end_x: 0.5, end_y: 0.1, duration: 800).perform
          Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.9, end_x: 0.5, end_y: 0.1, duration: 800).perform
          text("Log Out").click
          find_element(id: "button1").click
          find_element(id: "button1").click
          find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '4']").click
          find_element(id: "action_social").click
          find_element(id: "action_signup").click
        end
      end

      if test_type == "positive"
        if exists{text(popup_message)}
          error_status = 1
          $errors_collection.push(list_name[b])
          p "ERROR: #{print_message} #{list_name[b]}"
          make_screenshot("#{screenshot_name}")
          find_element(id: "button1").click
        else
          find_element(id: "action_settings").click
          sleep 3
          Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.9, end_x: 0.5, end_y: 0.1, duration: 800).perform
          Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.9, end_x: 0.5, end_y: 0.1, duration: 800).perform
          text("Log Out").click
          find_element(id: "button1").click
          find_element(id: "button1").click
          find_element(xpath: "//android.support.v7.app.ActionBar.Tab[@index = '4']").click
          find_element(id: "action_social").click
          find_element(id: "action_signup").click
        end

      end

    end

    b += 1

  end

  return error_status

end








# def scroll_screen(value, start_x, start_y, end_x, end_y, duration, scroll_to_start)
#   #scroll to start point
#   if scroll_to_start > 0
#     scroll_to_start.to_i.times(Appium::TouchAction.new.swipe(startx: start_x, starty: start_y, endx: end_x, endy: end_y, duration: duration).perform)
#   end
#   # current_screen = get_source
#   # previous_screen = ""
#
#   # binding.pry
#   i = 0
#   until (exists{value}) || (i < 5) do #|| (current_screen == previous_screen) do
#     Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.7, end_x: 0.5, end_y: 0.9, duration: 800).perform
#     # Appium::TouchAction.new.swipe(start_x: start_x.to_f, start_y: start_y.to_f, end_x: end_x.to_f, end_y: end_y.to_f, duration: duration.to_i).perform
#     # previous_screen = current_screen
#     # current_screen = get_source
#     sleep 1
#     i += 1
#   end
#
#   if exists{value}
#     puts("ok")
#   else
#     fail("Can not find element  #{value}")
#   end
#
# end