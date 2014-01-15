class Checkout
  include PageObject
  include UrlHelper
  
  button(:buy_product, :class => "buyNow")
  label(:pay_on_delivery, :xpath => '/html/body/div[2]/div[4]/div[2]/div[2]/div/div/ul/li[4]/span[2]/label')
  label(:pay_in_installments, :class => 'rencredit-img')

  select_list(:pod_shipping_address_state, :id => "shipping_address_state")
  select_list(:pod_shipping_address_area, :id => "shipping_address_area")
  
  link(:continue_shopping, :text => "Continue shopping")
  link(:proceed_to_payment, :text => "Proceed to Payment")
  link(:view_areas, :id => "view-cod-areas")
  link(:add_to_cart_link, :text => "Add To Cart")
  link(:buy_now_link, :text => "Buy Now")
  link(:pop_up_address, :id => "pop-up-address")

  div(:add_to_cart_div, :class => "form-holder")
  div(:complete_order_div, :class => "complete-order")
  div(:payment_methods_div, :class => "payment-methods")
  div(:deal_detail_div, :class => "deal-detail")
  div(:state_select_div, :class => "state-select")

  text_field(:email, :id => 'sign_in_email')
  text_field(:password, :id => 'sign_in_password')
  text_field(:pod_name, :id => 'cod-name')
  text_field(:pod_address, :id => 'cod-address')

  h2(:order_successful, :xpath => "/html/body/div[2]/div[4]/div[2]/h2")
  h6(:thanks_message, :xpath => "/html/body/div[2]/div[4]/div[2]/div/h6")

  paragraph(:cod_option, :class => 'cod-option')
  paragraph(:error_message, :class => 'errorMsg')

  unordered_list(:select_address, :xpath => '/html/body/div[2]/div[4]/div[2]/div/div[2]/div[2]/div[2]/form/ul')
  list_item(:rencredit_li, :class => 'rencredit')
  
  def add_to_cart
    div = @browser.find_element(:class => 'form-holder')
    div.find_element(:class => "addToCart", :text => "Add To Cart").click
  end

  def complete_order
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Complete Order", :type => "submit").click
  end

  def sign_in
    span = @browser.find_element(:class => 'signin-box-splash')
    span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def proceed
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Proceed to Payment", :type => "submit").click
  end

  def visit_non_shippable_page
    @browser.navigate.to(url_to_visit(:non_shippable_deal))
  end

  def visit_shippable_page
    @browser.navigate.to(url_to_visit(:shippable_deal))
  end

  def visit_non_shippable_pod
    @browser.navigate.to(url_to_visit(:pod_non_shippable_deal))
  end

  def visit_shippable_pod
    @browser.navigate.to(url_to_visit(:pod_shippable_deal))
  end
  
  def click_complete_button
    @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div[2]/div/div/div/div[4]/div[2]/form/span/input").click
  end

  def select_first_pod_address
    div = @browser.find_element(:id => "addresses-for-cod-popup")
    div.find_elements(:class => "address").first.click
  end

  def proceed_with_pod_address
    div = @browser.find_element(:id => "addresses-for-cod-popup")
    div.find_elements(:name => "commit", :value => "Proceed To Payment", :type => "submit").first.click
  end

  def proceed_with_new_pod_address
    div = @browser.find_element(:id => "addresses-for-cod-popup")
    div.find_elements(:name => "commit", :value => "Proceed To Payment", :type => "submit").last.click
  end

  def fill_shipping_address
    self.pod_name = "test add"
    self.pod_address = "1/4 west patel nagar"
  end

  def select_first_address
    self.select_address_element.click
  end

  def login_user
    self.proceed_to_payment
    populate_page_with data_for("users/admin_first")
    self.sign_in
  end

  def continue_payment_in_installation
    div = @browser.find_element(:id => "rencredit_mode")
    span = div.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :type => "submit", :value => "Continue").click
  end

end
 