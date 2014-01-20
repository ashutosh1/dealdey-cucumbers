Feature: account settings
  As a user I can update my profile and addresses

Background:
  And I close the subscription popup
  Given I am signed in as user
  Given I am on account page

Scenario: on account page i should see profile detail
  Then I see profile details 

Scenario: update profile
  And I update my profile
  Then I should see flash notice "Your Account Details have been updated"

Scenario: update name
  And I update name
  Then I should see flash notice "Your Account Details have been updated"
  Then I should see updated name

Scenario: update gender
  And I update gender
  Then I should see flash notice "Your Account Details have been updated"
  Then I should see updated gender

Scenario: uncheck all news letter check box
  And I click select none
  And I save news letter settings
  Then All select box should be unchecked

Scenario: update news letter settings
  And I update news letter settings
  Then I should see flash notice "Your Email Subscriptions have been updated successfully."

Scenario: add shipping address
  Given I am on update address page
  And I add a new address
  Then I should see flash notice "Your shipping address has been created"

Scenario: update shipping address
  Given I am on update address page
  And I edit first address
  Then I should see flash notice "Your shipping address has been updated"

Scenario: delete shipping address
  Given I am on update address page
  And I delete first address
  Then I should see flash notice "Shipping Address has been deleted"
  
Scenario: update password with wrong current password
  Given I am on update update password page
  And I update password with wrong current password
  Then I should see flash error "Please correct below errors before continuing"

Scenario: update password
  Given I am on update update password page
  And I update password
  Then I should see flash notice "Your password has been changed."
  And I reset the password
