Given(/^I visit home page and see the sign up popup$/) do
  on(SignupPage).sign_up_link
end

And(/^I submit blank signup form$/) do
  on(SignupPage).sign_up
end

And(/^I submit signup form with wrong mobile$/) do
  on(SignupPage).populate_user({"mobile" => "0898989"})
end

And(/^I submit signup form with existing email$/) do
  on(SignupPage).populate_user({"email" => "vijay@vinsol.com"   })
end

And(/^I submit signup form with different password and password confirmation$/) do
  on(SignupPage).populate_user({"password" => "123456", "password_confirmation" => "789635"})
end

And(/^I submit signup form$/) do
  on(SignupPage).gender_element[1].click
  on(SignupPage).age_bracket_element[2].click
  on(SignupPage).populate_user  
end

And(/^I submit signup form with wrong email$/) do
  on(SignupPage).populate_user({"email" => "test"})
end
