require "selenium-webdriver"

Before do | scenario |

  @browser = Selenium::WebDriver.for :firefox
  @browser.manage.window.maximize
  @browser.manage.timeouts.implicit_wait = 30
  @browser.get("http://vinsol:v1ns0l@dd@www.staging.dealdey.com")

end

After do
  @browser.quit
end
