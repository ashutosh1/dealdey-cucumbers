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
  And I submit sign in form with invalid credentials
  Then I should see error message "Invalid email or password."

Scenario: sign in without password
  And I submit sign in form without password
  Then I should see error message "Invalid email or password."

Scenario: sign in with wrong password
  And I submit sign in form with wrong password
  Then I should see error message "Invalid email or password."

Scenario: sign in with valid credentials
  And I submit sign in form with valid credentials
  Then I should see flash notice "Signed in successfully."
