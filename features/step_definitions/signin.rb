And /^I click Sign In link$/ do
  on(SigninPage).sign_in_link
end

And /^I click on Sign In button$/ do
  on(SigninPage).sign_in
  on(SigninPage).wait_for_ajax
end

Then(/^I should see sign in popup$/) do
  expect(on(SigninPage).sign_in_popup?).to eq(true)
end

Given(/^I visit home page and see the sign in popup$/) do
  rescue_background_exception{on(SigninPage).sign_in_link}
end

Given(/^I am signed in as user$/) do
  rescue_background_exception{on(SigninPage).signed_in_user}
  on(SigninPage).wait_until do 
    on(SharedPage).flash_notice?
  end
end

Then(/^I should see error message "([^\"]*)"$/) do |expected_text|
  expect(@current_page.error_message_elements[-1].element.text).to eq(expected_text)
end

And(/^I submit sign in form with valid credentials$/)do 
  on(SigninPage).populate_signin_form
  step "I click on Sign In button"
  on(SigninPage).wait_until do 
    on(SharedPage).flash_notice?
  end
end

And(/^I submit sign in form with wrong password$/)do 
  on(SigninPage).populate_signin_form({:password => "xyz"})
  step "I click on Sign In button"
end

And(/^I submit sign in form without password$/)do 
  on(SigninPage).populate_signin_form({:password => ""})
  step "I click on Sign In button"
end

And(/^I submit sign in form with invalid credentials$/)do 
  on(SigninPage).populate_signin_form({:email => "xz@zv.com", :password => "xyz"})
  step "I click on Sign In button"
end