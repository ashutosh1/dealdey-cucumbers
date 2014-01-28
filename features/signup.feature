Feature: Signup Feature
  I need to make sure that user could sign up using valid data

Background:
  Given I visit home page and see the sign up popup
  
Scenario: submits blank form
  And I submit blank signup form
  Then I should see inline error on all "SignupPage::DEFAULT_ATTR"

Scenario: submit form with wrong format of email
  And I submit signup form with wrong email
  Then I should see inline error "Email is invalid"
  
Scenario: submit form with wrong format of mobile
  And I submit signup form with wrong mobile
  Then I should see inline error "Mobile is invalid"

Scenario: submit form with existing email
  And I submit signup form with existing email
  Then I should see inline error "Email has already been taken"

Scenario: password and password confirmation does not match
  And I submit signup form with different password and password confirmation
  Then I should see inline error "Password doesn't match confirmation"

@not
Scenario: submit form with valid data
  And I submit signup form
  Then I should see flash notice "You have signed up successfully. Your login details have been sent to you through email."
