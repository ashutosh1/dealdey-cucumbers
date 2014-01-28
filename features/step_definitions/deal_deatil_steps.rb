And(/^I click 'Buy' link$/) do
  @current_page.buy_now_link
end

And(/^I add it to cart$/) do
  on(DealDetailPage).add_to_cart_link
end
  
And(/^I click 'Add To Cart' button$/) do
  @current_page.add_to_cart
end

And(/^I click 'buy' button$/) do
  @current_page.buy_product
end

Given(/^I am on deatil page of rencredit max deal$/) do
  on(DealDetailPage).visit_rencreditmax_deal
end

And(/^I add a deal to my cart$/) do
  step "I am on cart detail page for shippable item"
end

And(/^I add a another deal to my cart$/) do
  step "I am on cart detail page for non shippable item"
end

And(/^I add a with quantity greater than max allowed per user$/) do
  step "I am on deatil page of shippable deal"
  on(DealDetailPage).wait_until do
    on(DealDetailPage).cart_item_quantity?
  end
  on(DealDetailPage).add_option_to_select
  on(DealDetailPage).cart_item_quantity_element[-1].click
end