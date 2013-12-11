Given(/^I am logged in as user$/) do
  on(Checkout).proceed_to_payment
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
  assert_equal(true, on(Checkout).add_to_cart_div?)
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
  assert_equal(true, @current_page.continue_shopping?)
end

And(/^I click 'Proceed to Payment' link$/) do
  on(Checkout).proceed_to_payment
end

And(/^I proceed$/) do
  @current_page.proceed
end

Then(/^I should be on 'checkout' page$/) do
  assert_equal(true, @current_page.complete_order_div? && @current_page.payment_methods_div?)
end

And(/^I click 'Complete Order' button$/) do
  @current_page.complete_order
end

Then(/^Order should be successful$/) do
  assert_equal(true, @current_page.order_successful?)
end

Then(/^I should see 'Thanks for shopping on DealDey!'$/) do
  assert_equal(true, @current_page.thanks_message?)
end


Then(/^I should see available cod options$/) do
  assert_equal(true, @current_page.cod_option?)
end

Then(/^I should see delivery detail$/) do
  assert_equal(true, @current_page.deal_detail_div?)
end

And(/^I click 'View available area'$/) do
  on(Checkout).view_areas
end

Then(/^I should see states to select in popup$/) do
  assert_equal(true, @current_page.state_select_div?)
end

And(/^I add it to cart$/) do
  on(Checkout).add_to_cart_link
end

Given(/^I am on cart detail page for shippable item 'black\-slazenger\-mens\-polo\-shirt'$/) do
  on(Checkout).visit_shippable_page
  on(Checkout).add_to_cart_link
end

Then(/^I should see addresses to select$/) do
  assert_equal(true, @current_page.select_address?)
end

And(/^I select first address$/) do
  @current_page.select_address_element.click
end

Given(/^I am on deatil page of shippable pod deal$/) do
  on(Checkout).visit_shippable_pod
end

Given(/^I am on deatil page of non shippable pod deal$/) do
  on(Checkout).visit_non_shippable_pod
end
  
Given(/^I am on checkout page of shippable pod deal$/) do
  on(Checkout).visit_shippable_pod
  on(Checkout).add_to_cart_link
end

Given(/^I am on checkout page of non shippable pod deal$/) do
  on(Checkout).visit_non_shippable_pod
  on(Checkout).buy_now_link
end

Then(/^I should see pay on delivery section$/) do
  assert_equal(true, on(Checkout).view_areas && @current_page.state_select_div?)
end

And(/^I selcet Pay on Delivery and click complete button$/) do
  on(Checkout).pay_on_delivery_element.click
  on(Checkout).click_complete_button
end

And(/^I click 'Buy' link$/) do
  on(Checkout).buy_now_link
end

And(/^I selcet Pay on Delivery$/) do
  on(Checkout).pay_on_delivery_element.click
end

And(/^I click 'select\/add your shipping address'$/) do
  on(Checkout).pop_up_address
end

And(/^I select first pod address$/) do
  on(Checkout).select_first_pod_address
end

And(/^I click complete order button for pod$/) do
  on(Checkout).click_complete_button
end

And(/^I proceed with pod address$/) do
  on(Checkout).proceed_with_pod_address
end

And(/^I proceed with new pod address$/) do
  on(Checkout).proceed_with_new_pod_address
end

And(/^I fill new shipping address for pod$/) do
  on(Checkout).fill_shipping_address
  on(Checkout).pod_shipping_address_state_element[1].click
end

Then(/^I should see error message on pod popup "Please select a shipping address"$/) do 
  assert_equal(true, on(Checkout).error_message.visible?)
end