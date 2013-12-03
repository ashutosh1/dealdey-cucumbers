Given(/^I visit home page and see the sign up popup$/) do
  on(SignupPage).sign_up_link
end

Given(/^I click sign up link$/) do
  on(SignupPage).sign_up
end

Then(/^I should see error messages on all field$/) do
  SignupPage::DEFAULT_ATTR.each do |val|   
    on(SignupPage).check_errors?(val)
  end
end

Given(/^I fill wrong email$/) do
  on(SignupPage).populate_user({"email" => "test"})
end

Given(/^I fill wrong mobile$/) do
  on(SignupPage).populate_user({"mobile" => "0898989"})
end

Given(/^I fill existing email$/) do
  on(SignupPage).populate_user({"email" => "vijay@vinsol.com"   })
end

Given(/^I fill different password and password confirmation$/) do
  on(SignupPage).populate_user({"password" => "123456", "password_confirmation" => "789635"})
end

Given(/^I fill all the field$/) do
  on(SignupPage).populate_user  
end

Then(/^I should see error in sign up "(.*?)"$/) do |expected_text|
  @current_page.error_message.should == expected_text
end