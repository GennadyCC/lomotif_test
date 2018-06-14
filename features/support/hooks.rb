Before do
  $driver.start_driver
end

After do
  $driver.driver_quit
end

AfterConfiguration do #remove screenshot directory
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end