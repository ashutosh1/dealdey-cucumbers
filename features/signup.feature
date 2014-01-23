Feature: Signup Feature
  I need to make sure that user could sign up using valid data

Background:
  Given I visit home page and see the sign in popup
  
Scenario: submits blank form
  And I click sign up link
  Then I should see inline error on all "SignupPage::DEFAULT_ATTR"

Scenario: submit form with wrong format of email
  And I fill wrong email
  And I click sign up link
  Then I should see inline error "Email is invalid"
  
Scenario: submit form with wrong format of mobile
  And I fill wrong mobile
  And I click sign up link
  Then I should see inline error "Mobile is invalid"

Scenario: submit form with existing email
  And I fill existing email
  And I click sign up link
  Then I should see inline error "Email has already been taken"

Scenario: password and password confirmation does not match
  And I fill different password and password confirmation
  And I click sign up link
  Then I should see inline error "Password doesn't match confirmation"

@not
Scenario: submit form with valid data
  And I fill all the field
  And I click sign up link
  Then I should see flash notice "You have signed up successfully. Your login details have been sent to you through email."
