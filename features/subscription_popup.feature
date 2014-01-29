Feature: subscription popup
  As a user i can subscribe news letter

Background:
  Given I visit home page
  
Scenario: verify number, text, button on subscription popup
  Then I should see subscription popup
  Then I should see subscribe now button for subscription popup

Scenario: verify sign in and signup button
  Then I should see subscribe now button for subscription popup
  And I close the subscription popup
  Then I should see sign in link
  Then I should see sign up link

Scenario: subscription with invalid email
  And I submit subscription form with email "test"
  Then I should see flash error "Email is invalid"

Scenario: subscription with blank email
  And I submit subscription form with email " "
  Then I should see flash error "Email can't be blank"

Scenario: subscription with valid email
  And I submit subscription form with email "test@example.com"
  Then I should see subscription notice "Subscription Successful"
