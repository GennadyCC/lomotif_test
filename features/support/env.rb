require "appium_lib"
require "pry"

def caps
  { caps: {
      deviceName: "Android",
      platformName: "Android",
      # app: (File.join(File.dirname(__FILE__), "base.apk")),
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

def check_pop_up(text)
  if exists{text(text)}
    text("Skip").click
  end
end