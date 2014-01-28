class CartPage
  include PageObject
  include DataMagic
  
  link(:continue_shopping, :text => "Continue shopping")
  link(:proceed_to_payment, :text => "Proceed to Payment")

  select_list(:new_shipping_address_state, :id => "state")
  select_list(:new_shipping_address_area, :id => "area")
  div(:new_ship_address, :class => "cart_ship_address")

  text_field(:shipping_address_name, :id => "cart_shipping_address_attributes_name")
  text_field(:address_line, :id => "cart_shipping_address_attributes_address_line")
  text_field(:address_landmark, :id => "cart_shipping_address_attributes_landmark")
  form(:new_ship_address_form, :class => "edit_cart")

  span(:deals_count_in_cart)do |page|
    page.unordered_list_element(:class => "cart-header").link_element(:class => "cart-header").span_element(:class => "count")
  end

  def proceed
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Proceed to Payment", :type => "submit").click
  end

  def proceed_with_new_address
    @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div/div[2]/form/dl/span[2]/input").click
  end

  def populate_new_shipping_address
    populate_page_with data_for("address/new_shipping_address")
    self.new_shipping_address_state_element[1].click
    self.new_shipping_address_area_element[1].click
    proceed_with_new_address
  end

end