And(/^I am logged in as merchant with valid subscription$/) do
  on(MerchantHomePage).sign_in_merchant("merchant_with_valid_subscription")
end 

And(/^I am logged in as merchant with invalid subscription$/) do
  on(MerchantHomePage).sign_in_merchant("merchant_with_invalid_subscription")
end 

And(/^I submit promo offer$/) do
  on(MerchantHomePage).save_promo
end 

And(/^I fill promo "([^\"]*)" with "([^\"]*)"$/) do|promo_attr, value|
  on(MerchantHomePage).partial_populate_promo({promo_attr.to_sym => value})
end 

Then(/^I should see inline error on all promo fields$/) do
  MerchantHomePage::PROMO_ATTR.each do |val|
    expect(on(MerchantHomePage).check_errors?(val)).to eq(true)
  end
end 

Then(/^I should see inline error on promo "([^\"]*)"$/)do|msg|
  expect(on(MerchantHomePage).check_inline_errors?(msg)).to eq(true)
end 

And(/^I fill promo offer form$/) do
  on(MerchantHomePage).populate_promo
end 