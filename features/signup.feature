Feature: Signup Feature
  I need to make sure that user could sign up using valid data
  
Scenario: submits blank form
  Given I visit home page and see the sign up popup
  And I click sign up link
  Then I should see error messages on all field

Scenario: submit form with wrong format of email
  Given I visit home page and see the sign up popup
  And I fill wrong email
  And I click sign up link
  Then I should see error in sign up "Email is invalid"

Scenario: submit form with wrong format of mobile
  Given I visit home page and see the sign up popup
  And I fill wrong mobile
  And I click sign up link
  Then I should see error in sign up "Mobile is invalid"

Scenario: submit form with existing email
  Given I visit home page and see the sign up popup
  And I fill existing email
  And I click sign up link
  Then I should see error in sign up "Email has already been taken"

Scenario: password and password confirmation does not match
  Given I visit home page and see the sign up popup
  And I fill different password and password confirmation
  And I click sign up link
  Then I should see error in sign up "Password doesn't match confirmation"

@not
Scenario: submit form with valid data
  Given I visit home page and see the sign up popup
  And I fill all the field
  And I click sign up link
  Then I should see flash notice "You have signed up successfully. Your login details have been sent to you through email."
