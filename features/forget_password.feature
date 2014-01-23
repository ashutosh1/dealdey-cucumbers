Feature: Forget Password
  I need to make sure user can reset their password
  
Background:
  And I close the subscription popup
  Given I visit home page and see the sign in popup
  And I click forget password link

Scenario: forget password page
  Then I should see forget password page

Scenario: submit with blank email
  And I submit resend instruction with " "
  Then I should see error "Email can't be blank"

Scenario: submit with wrong format email
  And I submit resend instruction with "test"
  Then I should see error "Email not found"

Scenario: submit with non existing email
  And I submit resend instruction with "test@example.com"
  Then I should see error "Email not found"

Scenario: submit with correct email
  And I submit resend instruction with "user@mailinator.com"
  Then I should see flash notice "You will receive an email with an option to change password."
