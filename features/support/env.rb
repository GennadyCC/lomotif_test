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
    puts("ok")
  else
    FileUtils.mkdir_p("screenshots")
    puts("create folder")
  end

  time_stamp = Time.now.strftime(text + "-" + "%Y-%m-%d_%H.%M.%S")
  screenshot_name = time_stamp + ".png"
  screenshot_file = File.join("screenshots", screenshot_name)
  $driver.screenshot(screenshot_file)
  embed("#{screenshot_file}", "image/png")
end