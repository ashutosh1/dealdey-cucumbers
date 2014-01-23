Feature: sign in
  As an admin i need to make sure only registered people could sign in

Background:
  Given I visit home page and see the sign in popup

Scenario: sign in popup
  Then I should see sign in popup

Scenario: sign in with blank credentials
  And I click on Sign In button
  Then I should see error message "Invalid email or password."

Scenario: sign in with invalid credentials
  And I fill sign in email with "test"
  And I click on Sign In button
  Then I should see error message "Invalid email or password."

Scenario: sign in with valid credentials
  And I fill sign in email with "vijay@vinsol.com"
  And I fill sign in password with "123456"
  And I click on Sign In button
  Then I should see flash notice "Signed in successfully."

Scenario: sign in without password
  And I fill sign in email with "vijay@vinsol.com"
  And I fill sign in password with ""
  And I click on Sign In button
  Then I should see error message "Invalid email or password."

Scenario: sign in with wrong password
  And I fill sign in email with "vijay@vinsol.com"
  And I fill sign in password with "xyz"
  And I click on Sign In button
  Then I should see error message "Invalid email or password."

