Feature: account settings
  As a merchant i can sign in or as user can sign up as merchant

Background:
  And I close the subscription popup
  Given I am on merchant welcome page

Scenario: I should see links
  Then I see signin and signup links

Scenario: I should see sign in popup
  And I click sign in as merchant link
  Then I see merchant sign in form popup

Scenario: I am on signup page
  Given I am on merchant signup page
  Then I should see merchant signup form

Scenario: sign in with wrong data
  And I click sign in as merchant link
  And I submit merchant sign in form with wrong credentials
  Then I should see error message "Invalid Email or Password."
  
Scenario: sign in with correct credentials
  And I click sign in as merchant link
  And I submit merchant sign in form
  Then I should be on merchant home page

Scenario: submit blank form
  Given I am on merchant signup page
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error on all field  

Scenario: submit form with blank name
  Given I am on merchant signup page
  And I fill "business_name" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Business name can't be blank"

Scenario: submit form with blank location
  Given I am on merchant signup page
  And I fill "location" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Location can't be blank"  

Scenario: submit form with blank email
  Given I am on merchant signup page
  And I fill "email" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Email can't be blank" 

Scenario: submit form with blank phone
  Given I am on merchant signup page
  And I fill "phone" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Phone can't be blank"  

Scenario: submit form with blank contact_person
  Given I am on merchant signup page
  And I fill "contact_person" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Contact person can't be blank"

Scenario: submit form with blank business_description
  Given I am on merchant signup page
  And I fill "business_description" with ""
  And I submit the signup form
  Then I should see flash error "Please fix the below mentioned errors to continue."
  Then I should see inline error "Business description can't be blank"

Scenario: submit form with invalid email
  Given I am on merchant signup page
  And I fill "email" with "test"
  And I fill "location" with ""
  And I submit the signup form
  Then I should see inline error "Email is invalid"

Scenario: submit form with valid data and deal offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I submit the signup form
  Then I should see flash notice "Your Request has been created successfully"

Scenario: submit form with promo offer without logo
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I submit the signup form
  Then I should see inline error "Logo can't be blank"

Scenario: submit form with promo offer
  Given I am on merchant signup page
  And I fill merchant signup form
  And I check offer promo checkbox
  And I upload a logo
  And I submit the signup form
  Then I should see flash notice "You have signed up successfully. Your login details have been sent to you through email. You will be able to login once your account is activated by the administrator."  

Scenario: forget password page
  And I click sign in as merchant link
  And I click forget password link
  Then I should be on merchant forget password page

Scenario: submit forget password form without email
  And I click sign in as merchant link
  And I click forget password link
  And I click Send me reset password instructions
  Then I should see error "Email can't be blank"

Scenario: submit forget password form with wrong email
  And I click sign in as merchant link
  And I click forget password link    
  And I fill merchant email for resend instruction with "test@example.com"
  And I click Send me reset password instructions
  Then I should see error "Email not found"

Scenario: submit forget password form with correct email
  And I click sign in as merchant link
  And I click forget password link    
  And I fill merchant email for resend instruction with "merchant@mailinator.com"  
  And I click Send me reset password instructions
  Then I should see flash notice "You will receive an email with an option to change password."
