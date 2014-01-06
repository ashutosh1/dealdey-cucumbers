And(/^I am logged in as user$/) do
  on(Checkout).login_user
end

Given(/^I am on deatil page of deal 'limited\-time\-offer'$/) do
  on(Checkout).visit_non_shippable_page
end

Given(/^I am on deatil page of shippable deal$/) do
  on(Checkout).visit_shippable_page
end

Then(/^I should see 'Add To Cart' popup$/) do
  expect(on(Checkout).add_to_cart_div?).to eq(true)
end

And(/^I wait for 5 seconds$/) do
  sleep(5)
end

And(/^I am on cart detail page for non shippable item$/) do
  on(Checkout).visit_non_shippable_page
  on(Checkout).buy_product
  on(Checkout).add_to_cart
end

Then(/^I should be on 'checkout' page$/) do
  expect(@current_page.complete_order_div?).to eq(true)
  expect(@current_page.payment_methods_div?).to eq(true)
end

And(/^I click 'Complete Order' button$/) do
  @current_page.complete_order
end

Then(/^Order should be successful$/) do
  expect(@current_page.order_successful?).to eq(true)
end

Then(/^I should see 'Thanks for shopping on DealDey!'$/) do
  expect(@current_page.thanks_message?).to eq(true)
end

Then(/^I should see available cod options$/) do
  expect(@current_page.cod_option?).to eq(true)
end

Then(/^I should see delivery detail$/) do
  expect(@current_page.deal_detail_div?).to eq(true)
end

And(/^I click 'View available area'$/) do
  on(Checkout).view_areas
end

Then(/^I should see states to select in popup$/) do
  expect(@current_page.state_select_div?).to eq(true)
end

Given(/^I am on cart detail page for shippable item$/) do
  on(Checkout).visit_shippable_page
  on(Checkout).add_to_cart_link
end

Then(/^I should see addresses to select$/) do
  expect(@current_page.select_address?).to eq(true)
end

And(/^I select first address$/) do
  @current_page.select_first_address
end

Given(/^I am on deatil page of shippable pod deal$/) do
  on(Checkout).visit_shippable_pod
end

Given(/^I am on deatil page of non shippable pod deal$/) do
  on(Checkout).visit_non_shippable_pod
end
  
Given(/^I am on checkout page of shippable pod deal$/) do
  on(Checkout).visit_shippable_pod
  on(Checkout).buy_now_link
  on(Checkout).add_to_cart_link
end

Given(/^I am on checkout page of non shippable pod deal$/) do
  on(Checkout).visit_non_shippable_pod
  on(Checkout).buy_now_link
end

Then(/^I should see pay on delivery section$/) do
  expect(on(Checkout).view_areas && @current_page.state_select_div?).to eq(true)
end

And(/^I selcet Pay on Delivery and click complete button$/) do
  on(Checkout).pay_on_delivery_element.click
  on(Checkout).click_complete_button
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
  expect(on(Checkout).error_message?).to eq(true)
end

Given(/^I am on cart deatil page of rencredit max deal$/) do
  navigate_to(Checkout).login_user
end

Given(/^I am on checkout page of rencredit max deal$/) do
  navigate_to(Checkout).login_user
  @current_page.select_first_address
  @current_page.proceed_to_payment
end

Then(/^I should see 'Pay in Installments' option$/) do
  expect(on(Checkout).pay_in_installments?).to eq(true)
end

Then(/^I should not see 'Pay in Installments' option$/) do
  expect(on(Checkout).rencredit_li).to eq("")
end

And(/^I select 'Pay in Installments' option$/) do
  on(Checkout).pay_in_installments_element.click
end

And(/^I click continue$/) do
  on(Checkout).continue_payment_in_installation
end

Given(/^I am on checkout page of rencredit max deal with sum greater than max limit$/) do
  navigate_to(Checkout, :using => :rencreditmax_deal_greater_than_max_limit).login_user
  @current_page.select_first_address
  @current_page.proceed_to_payment
end

And(/^I click continue payment$/) do
  on(Checkout).continue_payment
end

Given(/^I am on checkout page of rencredit deal$/) do
  navigate_to(Checkout, :using => :rencredit_deal).login_user
  @current_page.select_first_address
  @current_page.proceed_to_payment
end

Then(/^I should see two products in my cart on cart page$/) do
  expect(@browser.find_elements(:css => ".cart_item_area").size).to be >= 2
end

Given(/^I am on checkout page with rencredit and normal product$/) do 
  navigate_to(DealDetailPage, :using => :rencredit_deal).add_to_cart_link
  navigate_to(DealDetailPage, :using => :non_rencredit_deal).add_to_cart
end