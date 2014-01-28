And(/^I click 'Proceed to Payment' link$/) do
  @current_page.proceed_to_payment
end

And(/^I proceed$/) do
  on(CartPage).proceed
end

Then(/^I should see 'Continue shopping' link$/) do
  expect(@current_page.continue_shopping?).to eq(true)
end

Given(/^I am on cart page for shippable item$/) do
  step "I am on cart detail page for shippable item"
  step "I am logged in as user"
end

Then(/^I should see new ship addresses form$/) do
  expect(on(CartPage).new_ship_address_form?).to eq(true)
end

And(/^I submit the new shipping form$/) do
  on(CartPage).proceed_with_new_address
end

And(/^I proceed with new shipping address$/) do
  on(CartPage).populate_new_shipping_address
end

Then(/^I should see (\d+) in cart icon on cart page$/) do|val|
  expect(on(CartPage).deals_count_in_cart).to eq(val)
end