class Checkout
  include PageObject
  
  button(:buy_product, :class => "buyNow")
  link(:continue_shopping, :text => "Continue shopping")
  link(:proceed_to_payment, :text => "Proceed to Payment")
  link(:view_areas, :id => "view-cod-areas")
  link(:sign_in_link, :text => "Sign In")
  link(:add_to_cart_link, :text => "Add To Cart")

  div(:add_to_cart_div, :class => "form-holder")
  div(:flash_notice, :class => "notice")
  div(:complete_order_div, :class => "complete-order")
  div(:payment_methods_div, :class => "payment-methods")
  div(:deal_detail_div, :class => "deal-detail")
  div(:state_select_div, :class => "state-select")

  text_field(:sign_in_email, :id => 'sign_in_email')
  text_field(:sign_in_password, :id => 'sign_in_password')

  h2(:order_successful, :xpath => "/html/body/div[2]/div[4]/div[2]/h2")
  h6(:thanks_message, :xpath => "/html/body/div[2]/div[4]/div[2]/div/h6")

  paragraph(:cod_option, :class => 'cod-option')

  unordered_list(:select_address, :xpath => '/html/body/div[2]/div[4]/div[2]/div/div[2]/div[2]/div[2]/form/ul')

  page_url "http://prep.dealdey.com/deals/limited-time-offer"
  
  def add_to_cart
    div = @browser.find_element(:class => 'form-holder')
    div.find_element(:class => "addToCart", :text => "Add To Cart").click
  end

  def complete_order
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Complete Order", :type => "submit")
  end

  def sign_in
    span = @browser.find_element(:class => 'signin-box-splash')
    span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def proceed
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Proceed to Payment", :type => "submit").click
  end

  def visit_shippable_page
    @browser.navigate.to( "http://prep.dealdey.com/deals/black-slazenger-mens-polo-shirt")
  end

  
end
