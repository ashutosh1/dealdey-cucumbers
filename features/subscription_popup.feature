Feature: subscription popup
  As a user i can subscribe deals
  
Scenario: subscription popup
  Given I visit home page
  Then I should see subscription popup
  Then I should see span having number to call
  Then I should see pod text
  Then I should see subscribe now button for subscription popup

Scenario: list of sign in and signup
  Given I visit home page
  Then I should see subscribe now button for subscription popup
  And I closed the subscription popup
  Then I should see unordered sign in and sign up header links
  Then I should see sign in list and link 
  Then I should see sign up list and link

Scenario: sign in and signup links
  Given I visit home page
  And I closed the subscription popup
  Then I should see sign in link
  Then I should see sign up link

Scenario: sign in for subscription with invalid email
  Given I visit home page
  And I enter "test" into email field
  And I click subscribe now 
  Then I should see error message "Email is invalid"

Scenario: sign in for subscription with blank email
  Given I visit home page
  And I enter "" into email field
  And I click subscribe now 
  Then I should see error message "Email can't be blank"

Scenario: sign in for subscription with valid email
  Given I visit home page
  And I enter "test@example.com" into email field
  And I click subscribe now 
  Then I should see subscription notice "Subscription Successful"
