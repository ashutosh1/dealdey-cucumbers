Feature: account settings
  As a merchant I can update my profile, password and addresses

Background:
  And I close the subscription popup
  Given I am on merchant account page

Scenario: update merchant password
  Given I am on update password section of merchant account
  And I update merchant password
  Then I should see flash notice "Password updated successfully."
  And I reset the merchant password

Scenario: update merchant password without current password
  Given I am on update password section of merchant account
  And I update merchant password without "current_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Current password can't be blank"

Scenario: update merchant password without new password
  Given I am on update password section of merchant account
  And I update merchant password without "new_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Password can't be blank and doesn't match confirmation"

Scenario: update merchant password without confirm password
  Given I am on update password section of merchant account
  And I update merchant password without "confirm_password"
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Password doesn't match confirmation"

Scenario: update merchant password without confirm password
  Given I am on update password section of merchant account
  And I update merchant password with invalid current password
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Current password is invalid"

Scenario: update merchant password with blank fields
  Given I am on update password section of merchant account
  And I update merchant password with blank values
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error on all "MerchantAccountPage::MERCHANT_PASS_ATTR"
  