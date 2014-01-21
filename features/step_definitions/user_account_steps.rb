Given(/^I am on account page$/) do
  on(UserAccountPage).account
  on(UserAccountPage).settings
end

Then(/^I see profile details$/) do
  expect(on(UserAccountPage).profile_form?).to eq(true)
end 

And(/^I update my profile$/) do
  on(UserAccountPage).update_profile
end

And(/^I update name$/) do
  on(UserAccountPage).update_name
end

Then(/^I should see updated name$/) do
  expect(on(UserAccountPage).firstname).to eq("vijay")
end

And(/^I update gender$/) do
  on(UserAccountPage).gender_element[1].click
  on(UserAccountPage).save_profile
end

Then(/^I should see updated gender$/) do
  expect(on(UserAccountPage).gender).to eq("Male")
end

And(/^I click select none$/) do
  on(UserAccountPage).select_none_element.focus
  on(UserAccountPage).select_none
end

Then(/^All select box should be unchecked$/) do
  expect(on(UserAccountPage).checkbox_checked?).to eq(false)
end

And(/^I update news letter settings$/) do
  on(UserAccountPage).news_letter_checkbox_element.focus
  on(UserAccountPage).check_news_letter_checkbox
  on(UserAccountPage).save_news_letter
end

And(/^I save news letter settings$/) do
  on(UserAccountPage).save_news_letter
end

Given(/^I am on update address page$/) do
  on(UserAccountPage).address_tab
end

And(/^I add a new address$/) do
  on(UserAccountPage).add_new_address
end

And(/^I edit first address$/) do
  on(UserAccountPage).edit
  on(UserAccountPage).update_address
end

And(/^I delete first address$/) do
  on(UserAccountPage).delete
  alert = @browser.switch_to().alert();
  alert.accept()
end

Given(/^I am on update update password page$/) do
  on(UserAccountPage).password_tab
end

And(/^I update password with wrong current password$/) do
  on(UserAccountPage).wrong_pass_update
end

And(/^I update password$/) do
  on(UserAccountPage).update_password
end

And(/^I reset the password$/) do
  on(UserAccountPage).reset_update_password
end