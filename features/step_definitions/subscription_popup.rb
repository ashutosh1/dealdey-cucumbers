Given(/^I visit home page$/) do
end

Then(/^I should see subscription popup$/) do
  on(SubscriptionPopup).subscription_popup?
end

Then(/^I should see pod text$/) do
  on(SubscriptionPopup).pod_text?
end

Then(/^I should see span having number to call$/) do
  on(SubscriptionPopup).call?
end

Then(/^I should see subscribe now button for subscription popup$/) do
  @browser.find_element(:name => "commit", :value => "Subscribe Now").displayed?
end

Then(/^I closed the subscription popup$/) do
  on(SubscriptionPopup).close_subscription
end

Then(/^I should see unordered sign in and sign up header links$/) do
  on(SubscriptionPopup).header_link?
end

Then(/^I should see sign in list and link$/) do
  on(SubscriptionPopup).sign_in?
end

Then(/^I should see sign up list and link$/) do
  on(SubscriptionPopup).sign_up?
end

Then(/^I should see sign in link$/) do
  on(SubscriptionPopup).sign_in_link?
end

Then(/^I should see sign up link$/) do
  on(SubscriptionPopup).sign_up_link?
end

When /^I enter "(.*?)" into email field$/ do |email|
  on(SubscriptionPopup).subscription_email= email
end

And /^I click subscribe now$/ do
  on(SubscriptionPopup).register
end

Then(/^I should see error message "([^\"]*)"$/) do |expected_text|
  @current_page.error_message? && @current_page.error_message == expected_text
end

Then /^I should see subscription notice "([^\"]*)"$/ do |expected_text|
  @current_page.subscription_notice? && @current_page.subscription_notice.should == expected_text
end

Then(/^I should see "([^\"]*)"$/) do |expected_text|
  expect(@current_page.text).to include(expected_text)
end

Then(/^I should not see "([^\"]*)"$/) do |expected_text|
  expect(@current_page.text).to_not include(expected_text)
end

