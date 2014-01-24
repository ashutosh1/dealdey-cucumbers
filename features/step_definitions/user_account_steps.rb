Given(/^I am on account page$/) do
  rescue_background_exception do 
    on(UserAccountPage).account
    on(UserAccountPage).settings
  end
end

Then(/^I see profile details$/) do
  expect(on(UserAccountPage).profile_form?).to eq(true)
end 

And(/^I update my profile$/) do
  on(UserAccountPage).update_profile
end

And(/^I click select none$/) do
  on(UserAccountPage).select_none
end

Then(/^All select box should be unchecked$/) do
  expect(on(UserAccountPage).checkbox_checked?).to eq(false)
end

And(/^I update news letter settings$/) do
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

And(/^I update password with invalid current password$/) do
  on(UserAccountPage).fill_and_save_password_field({:current_password => "xyz"})
end

And(/^I update password$/) do
  on(UserAccountPage).fill_and_save_password_field
end

And(/^I reset the password$/) do
  on(UserAccountPage).reset_update_password
end

And(/^I update profile without "([^\"]*)"$/) do|pass_attr|
  on(UserAccountPage).populate_user_profile({pass_attr.to_sym => ""}, pass_attr)
end

And(/^I update profile with invalid mobile$/) do
  on(UserAccountPage).populate_user_profile({:mobile => "0567787878"}, "mobile")
end

And(/^I update profile without age bracket$/) do
  on(UserAccountPage).age_element[0].click
  on(UserAccountPage).save_profile
end

And(/^I update profile without gender$/) do
  on(UserAccountPage).gender_element[0].click
  on(UserAccountPage).save_profile
end

And(/^I submit blank shipping address form$/) do
  on(UserAccountPage).save_address
end

And(/^I update password without "([^\"]*)"$/) do|pass_attr|
  on(UserAccountPage).fill_and_save_password_field({pass_attr.to_sym => ""})
end

And(/^I update password with blank values$/) do
  on(UserAccountPage).save_password
end
