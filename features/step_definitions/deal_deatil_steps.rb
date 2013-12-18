And(/^I click 'Buy' link$/) do
  @current_page.buy_now_link
end

And(/^I add it to cart$/) do
  @current_page.add_to_cart_link
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