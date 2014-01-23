And /^I fill sign in email with "(.*?)"$/ do |email|
  on(SigninPage).email= email
end

And /^I fill sign in password with "(.*?)"$/ do |password|
  on(SigninPage).password= password
end

And /^I click Sign In link$/ do
  on(SigninPage).sign_in_link
end

And /^I click on Sign In button$/ do
  on(SigninPage).sign_in
  sleep(5)
end

Then(/^I should see sign in popup$/) do
  expect(on(SigninPage).sign_in_popup?).to eq(true)
end

Given(/^I visit home page and see the sign in popup$/) do
  rescue_background_exception{on(SigninPage).sign_in_link}
end

Given(/^I am signed in as user$/) do
  rescue_background_exception{on(SigninPage).signed_in_user}
end

Then(/^I should see error message "([^\"]*)"$/) do |expected_text|
  expect(@current_page.error_message_elements[-1].element.text).to eq(expected_text)
end