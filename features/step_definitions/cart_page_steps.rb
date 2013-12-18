And(/^I click 'Proceed to Payment' link$/) do
  @current_page.proceed_to_payment
end

And(/^I proceed$/) do
  @current_page.proceed
end

Then(/^I should see 'Continue shopping' link$/) do
  expect(@current_page.continue_shopping?).to eq(true)
end

