And /^I fill sign in email with "(.*?)"$/ do |email|
  on(SigninPage).sign_in_email= email
end

And /^I fill sign in password with "(.*?)"$/ do |password|
  on(SigninPage).sign_in_password= password
end

And /^I click Sign In link$/ do
  on(SigninPage).sign_in_link
end

And /^I click on Sign In button$/ do
  on(SigninPage).sign_in
end

Then(/^I should see sign in popup$/) do
  expect(on(SigninPage).sign_in_popup?).to eq(true)
end

Given(/^I visit home page and see the sign in popup$/) do
  on(SigninPage).sign_in_link
end

