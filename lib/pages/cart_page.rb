class CartPage
  include PageObject
  include DataMagic
  
  link(:continue_shopping, :text => "Continue shopping")
  link(:proceed_to_payment, :text => "Proceed to Payment")

  def proceed
    span = @browser.find_element(:class => "main-button-orange-arrow")
    span.find_element(:name => "commit", :value => "Proceed to Payment", :type => "submit").click
  end
  
end