Feature: sign in
  As an admin i need to make sure only registered people could sign in
  
Scenario: sign in popup
  Given I visit home page
  And I click Sign In link
  Then I should see sign in popup

Scenario: sign in with blank credentials
  Given I visit home page and see the sign in popup
  And I click on Sign In button
  Then I should see error message "Invalid email or password"

Scenario: sign in with invalid credentials
  Given I visit home page and see the sign in popup
  And I fill sign in email with "test"
  And I click on Sign In button
  Then I should see error message "Invalid email or password"

Scenario: sign in with valid credentials
  Given I visit home page and see the sign in popup
  And I fill sign in email with "vijay1@mailinator.com"
  And I fill sign in password with "123456"
  And I click on Sign In button
  Then I should see flash notice "Signed in successfully."

Scenario: sign in without password
  Given I visit home page and see the sign in popup
  And I fill sign in email with "vijay1@mailinator.com"
  And I fill sign in password with ""
  And I click on Sign In button
  Then I should see error message "Invalid email or password"

Scenario: sign in with wrong password
  Given I visit home page and see the sign in popup
  And I fill sign in email with "vijay1@mailinator.com"
  And I fill sign in password with "xyz"
  And I click on Sign In button
  Then I should see error message "Invalid email or password"

