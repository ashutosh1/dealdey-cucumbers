And(/^I click forget password link$/) do
  on(SigninPage).forget_password_link
end

Then(/^I should see forget password page$/) do
  on(ForgotPassword).forget_password_page?
end

And(/^I click Send me reset password instructions$/) do
  on(ForgotPassword).resend_password_instruction
end

Then(/^I should see error "(.*?)"$/) do |expected_text|
  @current_page.error_in_email_for_resend_instruction == expected_text
end

And(/^I fill email for resend instruction with "(.*?)"$/) do |email|
  on(ForgotPassword).fill_email(email)
end

