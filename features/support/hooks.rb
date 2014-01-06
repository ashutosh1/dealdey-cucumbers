require "selenium-webdriver"
require "selenium/client"
include DataMagic

Before do | scenario |

  DataMagic.load 'default.yml'
  obj_higlight = HighlightAbstractTest.new
  #to run cucumber parallel only below four line is required
  @browser = Selenium::WebDriver.for :firefox, :listener => obj_higlight
  @browser.get(data_for(:home)["url"])
  @browser.manage.window.maximize
  @browser.manage.timeouts.implicit_wait = 300
  
  # browser_type = ["*firefox", "*chrome"]
  #To run multiple browser parallel
  # browser_type.each do |i|
    #@browser = Selenium::WebDriver.for i.to_sym
    #@browser.get("http://vinsol:v1ns0l@dd@www.prep.dealdey.com")
    #@browser.manage.timeouts.implicit_wait = 30
  #   @browser = Selenium::Client::Driver.new \
  #     :host => "localhost",
  #     :port => 4444,
  #     :browser => "*firefox",
  #     :url => "http://vinsol:v1ns0l@dd@www.prep.dealdey.com",
  #     :timeout_in_seconds => 90

  #   @browser.start_new_browser_session
  # end
end

After do
  # @browser.close_current_browser_session
  @browser.quit
end