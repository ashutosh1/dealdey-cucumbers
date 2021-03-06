Given(/^I am on merchant welcome page$/) do
  rescue_background_exception{on(MerchantSignupPage).register_as_merchant}
end

Then(/^I see signin and signup links$/) do
  expect(on(MerchantSignupPage).signin_and_signup_links?).to eq(true)
end 

Given(/^I am on merchant signup page$/) do
  on(MerchantSignupPage).sign_up
end

Then(/^I should see merchant signup form$/) do
  expect(on(MerchantSignupPage).merchant_signup_form?).to eq(true)
end 

And(/^I submit the signup form$/) do
  on(MerchantSignupPage).submit_form
end 

And(/^I fill "([^\"]*)" with "([^\"]*)"$/) do|merch_attr, value|
  on(MerchantSignupPage).populate_merchant({merch_attr.to_sym => value})
end 

And(/^I fill merchant signup form$/) do
  on(MerchantSignupPage).populate_merchant
end 

And(/^I check offer promo checkbox$/) do
  on(MerchantSignupPage).select_offer_promo
end 

And(/^I upload a logo$/) do
  on(MerchantSignupPage).logo_file = File.join(File.dirname(__FILE__), '..', '..', 'config/data/images', 'flipkart.jpg')
end 

And(/^I click sign in as merchant link$/) do
  rescue_background_exception{on(MerchantSignupPage).sign_in_link}
end

Then(/^I see merchant sign_in form in popup$/) do
  expect(on(MerchantSignupPage).merchant_signin_form?).to eq(true)
end 

And(/^I click sign in as merchant button$/) do
  on(MerchantSignupPage).sign_in
end

And(/^I submit merchant sign in form with wrong credentials$/) do
  on(MerchantSignupPage).populate_merchant_signin_form({:merchant_email => "test@deal.com"})
end

And(/^I submit merchant sign in form$/) do
  on(MerchantSignupPage).populate_merchant_signin_form
end

And(/^I submit merchant sign in form with wrong password$/) do
  on(MerchantSignupPage).populate_merchant_signin_form({:merchant_password => "909090"})
end

And(/^I submit merchant sign in form without password$/) do
  on(MerchantSignupPage).populate_merchant_signin_form({:merchant_password => ""})
end

Then(/^I should be on merchant home page$/) do
  expect(on(MerchantSignupPage).promo_offer_div?).to eq(true)
end

Then(/^I should be on merchant forget password page$/) do
  expect(on(MerchantSignupPage).forget_password_page?).to eq(true)
end

And(/^I fill merchant email for resend instruction with "(.*?)"$/) do |email|
  on(MerchantSignupPage).user_email_for_resend = email
end