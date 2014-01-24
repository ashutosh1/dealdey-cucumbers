Feature: account settings
  As a user I can update my profile and addresses

Background:
  And I close the subscription popup
  Given I am signed in as user
  Given I am on account page

Scenario: I see profile detail
  Then I see profile details 

Scenario: update profile
  And I update my profile
  Then I should see flash notice "Your Account Details have been updated"

Scenario: update profile without firstname
  And I update profile without "firstname"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "FirstName can't be blank"

Scenario: update profile without lastname
  And I update profile without "lastname"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "LastName can't be blank"

Scenario: update profile without mobile
  And I update profile without "mobile"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Mobile can't be blank"

Scenario: update profile without age bracket
  And I update profile without age bracket
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Age Bracket can't be blank"

Scenario: update profile without gender
  And I update profile without gender
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Gender can't be blank"

Scenario: update profile with invalid format of mobile
  And I update profile with invalid mobile
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Mobile is invalid"

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

Scenario: add blank shipping address
  Given I am on update address page
  And I submit blank shipping address form
  Then I should see flash error "Please correct below errors, before continuing"
  Then I should see inline error on all "UserAccountPage::SHIPPING_ADDRESS_ATTRIBUTES"

Scenario: update shipping address
  Given I am on update address page
  And I edit first address
  Then I should see flash notice "Your shipping address has been updated"

Scenario: delete shipping address
  Given I am on update address page
  And I delete first address
  Then I should see flash notice "Shipping Address has been deleted"

Scenario: update password
  Given I am on update update password page
  And I update password
  Then I should see flash notice "Your password has been changed."
  And I reset the password

Scenario: update password with invalid current password
  Given I am on update update password page
  And I update password with invalid current password
  Then I should see flash error "Please correct below errors before continuing"

Scenario: update password without current password
  Given I am on update update password page
  And I update password without "current_password"
  Then I should see flash error "Please correct below errors before continuing"
  Then I should see inline error "Current password can't be blank"

Scenario: update password without new password
  Given I am on update update password page
  And I update password without "new_password"
  Then I should see flash error "Please correct below errors before continuing"
  Then I should see inline error "Password can't be blank and doesn't match confirmation"

Scenario: update password without confirm password
  Given I am on update update password page
  And I update password without "confirm_password"
  Then I should see flash error "Please correct below errors before continuing"
  Then I should see inline error "Password doesn't match confirmation"

Scenario: update password with blank fields
  Given I am on update update password page
  And I update password with blank values
  Then I should see flash error "Please correct below errors before continuing"
  Then I should see inline error on all "MerchantAccountPage::MERCHANT_PASS_ATTR"
  