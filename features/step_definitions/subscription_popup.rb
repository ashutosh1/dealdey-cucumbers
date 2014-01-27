Given(/^I visit home page$/) do
end

Then(/^I should see subscription popup$/) do
  expect(on(SubscriptionPopup).subscription_popup?).to eq(true)
end

Then(/^I should not see pod text$/) do
  expect(on(SubscriptionPopup).pod_text?).to eq(false)
end

Then(/^I should see not span having number to call$/) do
  expect(on(SubscriptionPopup).call?).to eq(false)
end

Then(/^I should see subscribe now button for subscription popup$/) do
  popup = @browser.find_element(:class => 'new_email_subscription')
  expect(popup.find_element(:name => "commit", :value => "Subscribe Now", :type => "submit").displayed?).to eq(true)
end

And(/^I close the subscription popup$/) do
  rescue_background_exception{on(SubscriptionPopup).close_subscription}
end

Then(/^I should see sign in link$/) do
  expect(on(SubscriptionPopup).sign_in?).to eq(true)
end

Then(/^I should see sign up link$/) do
  expect(on(SubscriptionPopup).sign_up?).to eq(true)
end

When /^I enter "(.*?)" into email field$/ do |email|
  on(SubscriptionPopup).subscription_email= email
end

And /^I click subscribe now$/ do
  on(SubscriptionPopup).register
end

Then /^I should see subscription notice "([^\"]*)"$/ do |expected_text|
  expect(@current_page.subscription_notice? && @current_page.subscription_notice == expected_text).to eq(true)
end

Then(/^I should see "([^\"]*)"$/) do |expected_text|
  expect(@current_page.text).to include(expected_text)
end

Then(/^I should not see "([^\"]*)"$/) do |expected_text|
  expect(@current_page.text).to_not include(expected_text)
end

