Given(/^I visit home page and see the sign up popup$/) do
  on(SignupPage).sign_up_link
end

Given(/^I click sign up link$/) do
  on(SignupPage).sign_up
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