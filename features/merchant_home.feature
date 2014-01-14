Feature: merchant home page
  As a merchant i can offer promo

Background:
  And I close the subscription popup
  Given I am on merchant welcome page
  And I click sign in as merchant link

Scenario: As a merchant with valid subscription
  And I am logged in as merchant with valid subscription
  Then I should be on merchant home page

Scenario: As a merchant with valid subscription submit blank promo offer
  And I am logged in as merchant with valid subscription
  And I submit promo offer
  Then I should see inline error on all promo fields  

Scenario: As a merchant with valid subscription submit promo offer with invalid url
  And I am logged in as merchant with valid subscription
  And I fill promo "promo_url" with "test"
  And I submit promo offer
  Then I should see inline error on promo "Coupon url is invalid"  

Scenario: As a merchant with valid subscription submit promo offer with blank address
  And I am logged in as merchant with valid subscription
  And I fill promo "business_address" with ""
  And I submit promo offer
  Then I should see inline error on promo "Business address can't be blank"  

Scenario: As a merchant with valid subscription submit promo offer with blank start date
  And I am logged in as merchant with valid subscription
  And I fill promo "coupon_start_date" with ""
  And I submit promo offer
  Then I should see inline error on promo "Start date can't be blank"  

Scenario: As a merchant with valid subscription submit promo offer with blank end date
  And I am logged in as merchant with valid subscription
  And I fill promo "coupon_end_date" with ""
  And I submit promo offer
  Then I should see inline error on promo "End date can't be blank"

Scenario: As a merchant with valid subscription submit promo offer 
  And I am logged in as merchant with valid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash notice "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator."

@invalid_subscription
Scenario: As a merchant with Invalid subscription submit promo offer
  And I am logged in as merchant with invalid subscription
  And I fill promo offer form
  And I submit promo offer
  Then I should see flash notice "Your Promo request has been received. You will be notified by email once your Promo is approved by the administrator. Please update your subscription with one of our available subscription plans to ensure your Promos visibility."

