Given(/^I am logged in as user$/) do
  on(Checkout).sign_in_link
  on(Checkout).sign_in_email= "vijay@vinsol.com"
  on(Checkout).sign_in_password= "123456"
  on(Checkout).sign_in
end

Given(/^I am on deatil page of deal 'limited\-time\-offer'$/) do
  visit_page Checkout
end

Given(/^I am on deatil page of shippable deal 'black\-slazenger\-mens\-polo\-shirt'$/) do
  on(Checkout).visit_shippable_page
end

Then(/^I should see 'Add To Cart' popup$/) do
  on(Checkout).add_to_cart_div?
end

And(/^I click 'Add To Cart' button$/) do
  on(Checkout).add_to_cart
end

And(/^I click 'buy' button$/) do
  on(Checkout).buy_product
end

And(/^I wait for 5 seconds$/) do
  sleep(5)
end

And(/^I am on cart detail page for non shippable item$/) do
  visit_page Checkout
  on(Checkout).buy_product
  on(Checkout).add_to_cart
end

Then(/^I should see 'Continue shopping' link$/) do
  @current_page.continue_shopping?
end

And(/^I click 'Proceed to Payment' link$/) do
  on(Checkout).proceed_to_payment
end

And(/^I proceed$/) do
  @current_page.proceed
end

Then(/^I should be on 'checkout' page$/) do
  @current_page.complete_order_div? && @current_page.payment_methods_div?
end

Then(/^I click 'Complete Order' button$/) do
  @current_page.complete_order
end

Then(/^Order should be successful$/) do
  @current_page.order_successful?
end

Then(/^I should see 'Thanks for shopping on DealDey!'$/) do
  @current_page.thanks_message?
end


Then(/^I should see available cod options$/) do
  @current_page.cod_option?
end

Then(/^I should see delivery detail$/) do
  @current_page.deal_detail_div?
end

And(/^I click 'View available area'$/) do
  on(Checkout).view_areas
end

Then(/^I should see states to select in popup$/) do
  @current_page.state_select_div?
end

And(/^I add it to cart$/) do
  @current_page.add_to_cart_link
end

Given(/^I am on cart detail page for shippable item 'black\-slazenger\-mens\-polo\-shirt'$/) do
  on(Checkout).visit_shippable_page
  on(Checkout).add_to_cart_link
end

Then(/^I should see addresses to select$/) do
  @current_page.select_address?
end

Then(/^I select first address$/) do
  @current_page.select_address_element.click
end
