Given(/^I am on merchant account page$/) do
  navigate_to(MerchantHomePage, :using => :merchant_account_page).sign_in_merchant
  on(MerchantHomePage).my_account
end

Given(/^I am on update password section of merchant account$/) do
  on(MerchantAccountPage).password_tab
end

Given(/^I am on my subscription section of merchant account$/) do
  on(MerchantAccountPage).my_subscription_tab
end

And(/^I update merchant password$/) do
  on(MerchantAccountPage).fill_and_save_password_field
end

And(/^I reset the merchant password$/) do
  on(MerchantAccountPage).reset_updated_password
end

And(/^I update merchant password without "([^\"]*)"$/) do|pass_attr|
  on(MerchantAccountPage).fill_and_save_password_field({pass_attr.to_sym => ""})
end

And(/^I update merchant password with blank values$/) do
  on(MerchantAccountPage).save_password
end

And(/^I update merchant password with invalid current password$/) do
  on(MerchantAccountPage).fill_and_save_password_field({:current_password => "xyz"})
end

Then(/^I should see subscription section$/) do
  expect(on(MerchantAccountPage).subscription_section?).to eq(true)
end

Then(/^I should see normal and premium offer for subscription$/) do
  expect(on(MerchantAccountPage).multiple_subscription_offer?).to eq(true)
end