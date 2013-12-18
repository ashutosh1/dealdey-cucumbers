class DealDetailPage
  include PageObject
  include SharedMethods
  
  #shipppable deals on detail page as popup
  link(:add_to_cart_link, :text => "Add To Cart")
  #non shippable deal
  link(:buy_now_link, :text => "Buy Now")

  button(:buy_product, :class => "buyNow")

  paragraph(:available_for_emi, :class => "emi_option")

  select_list(:cart_item_quantity, :id => "cart_item_quantity")

  def add_to_cart
    div = @browser.find_element(:class => 'form-holder')
    div.find_element(:class => "addToCart", :text => "Add To Cart").click
  end
  
  def visit_rencreditmax_deal
    @browser.navigate.to(url_to_visit(:rencreditmax_deal))
  end

  def select_quantity
    self.cart_item_quantity_element[12].click
  end

  def visit_rencredit_deal
    @browser.navigate.to(url_to_visit(:rencredit_deal))
  end

  def visit_non_rencredit_deal
    @browser.navigate.to(url_to_visit(:shippable_deal))
  end


end