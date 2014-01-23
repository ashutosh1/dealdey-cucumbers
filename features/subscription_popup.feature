Feature: subscription popup
  As a user i can subscribe news letter

Background:
  Given I visit home page
  
Scenario: verify number, text, button on subscription popup
  Then I should see subscription popup
  Then I should see not span having number to call
  Then I should not see pod text
  Then I should see subscribe now button for subscription popup

Scenario: verify sign in and signup button
  Then I should see subscribe now button for subscription popup
  And I close the subscription popup
  Then I should see sign in link
  Then I should see sign up link

Scenario: subscription with invalid email
  And I enter "test" into email field
  And I click subscribe now 
  Then I should see flash error "Email is invalid"

Scenario: subscription with blank email
  And I enter "" into email field
  And I click subscribe now 
  Then I should see flash error "Email can't be blank"

Scenario: subscription with valid email
  And I enter "test@example.com" into email field
  And I click subscribe now 
  Then I should see subscription notice "Subscription Successful"
