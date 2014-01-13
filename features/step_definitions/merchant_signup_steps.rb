Given(/^I am on merchant welcome page$/) do
  on(MerchantSignupPage).register_as_merchant
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

Then(/^I should see inline error on all field$/) do
  MerchantSignupPage::MERCHANT_ATTR.each do |val|
    expect(on(MerchantSignupPage).check_errors?(val)).to eq(true)
  end
end 

And(/^I fill "([^\"]*)" with "([^\"]*)"$/) do|merch_attr, value|
  on(MerchantSignupPage).populate_merchant({merch_attr.to_sym => value})
end 

Then(/^I should see inline error "([^\"]*)"$/) do|msg|
  expect(on(MerchantSignupPage).check_inline_errors?(msg)).to eq(true)
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
  on(MerchantSignupPage).sign_in_link
end

Then(/^I see merchant sign in form popup$/) do
  expect(on(MerchantSignupPage).merchant_signin_form?).to eq(true)
end 

And(/^I click sign in as merchant button$/) do
  on(MerchantSignupPage).sign_in
end

And(/^I submit merchant sign in form with wrong credentials$/) do
  on(MerchantSignupPage).populate_merchant_signup_form({:merchant_email => "test@deal.com"})
end

And(/^I submit merchant sign in form$/) do
  on(MerchantSignupPage).populate_merchant_signup_form
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