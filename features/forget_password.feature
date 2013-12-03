Feature: Forget Password
  I need to make sure user can reset their password
  
Scenario: forget password page
  Given I visit home page and see the sign in popup
  And I click forget password link
  Then I should see forget password page

Scenario: submit with blank email
  Given I visit home page and see the sign in popup
  And I click forget password link
  And I click Send me reset password instructions
  Then I should see error "Email can't be blank"

Scenario: submit with wrong format email
  Given I visit home page and see the sign in popup
  And I click forget password link
  And I fill email for resend instruction with "test"
  And I click Send me reset password instructions
  Then I should see error "Email not found"

Scenario: submit with non existing email
  Given I visit home page and see the sign in popup
  And I click forget password link
  And I fill email for resend instruction with "test@example.com"
  And I click Send me reset password instructions
  Then I should see error "Email not found"

Scenario: submit with correct email
  Given I visit home page and see the sign in popup
  And I click forget password link
  And I fill email for resend instruction with "vijay1@mailinator.com"
  And I click Send me reset password instructions
  Then I should see flash notice "You will receive an email with an option to change password."
