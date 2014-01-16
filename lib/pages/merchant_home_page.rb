class MerchantHomePage
  include PageObject
  
  PROMO_ATTR = ["Business address", "Title", "Start date", "End date", "Description"]

  text_field(:promo_url, :id => "discount_coupon_coupon_url")
  text_field(:promo_code, :id => "discount_coupon_code")
  text_field(:business_address, :id => "discount_coupon_business_address")
  text_field(:coupon_title, :id => "discount_coupon_title")
  text_field(:coupon_keywords, :id => "discount_coupon_keywords")
  text_field(:coupon_start_date, :id => "discount_coupon_start_date")
  text_field(:coupon_end_date, :id => "discount_coupon_end_date")
  paragraphs(:error_message, :class => 'errorMsg')
  text_field(:merchant_email, :id => "merchant_email")
  text_field(:merchant_password, :id => "merchant_password")
  form(:promo_offer_form, :id => 'new_discount_coupon')
  link(:logout, :text => "Logout")
  link(:my_account, :text => "My Account")  
  link(:contact, :text => "Contact")

  link(:proceed_to_payment, :text => "Proceed To Payment")
  div(:merchant_notice, :id => "merchant-notice")
  div(:merchant_welcome)do|page|
    page.div_element(:id => "merchant-notice").div_element(:class => "merchant_welcome")
  end
  span(:cancel_subscription, :class => "cancel-image")

  def save_promo
    div = @browser.find_element(:class => "submit-form")
    div.find_element(:name => "commit", :type => "submit", :value => "Submit").click
  end

  def sign_in_merchant(valid_or_invalid_subscription=nil)
    merchant = valid_or_invalid_subscription.nil? ? "merchant_with_valid_subscription" : valid_or_invalid_subscription
    data = data_for("merchant_details/#{merchant}")
    populate_page_with data
    sign_in
  end

  def check_errors?(val)
    self.error_message_elements.collect(&:text).include?(val + " can't be blank")
  end

  def populate_promo(data = {})
    data = data_for("merchant_details/merchant_promo_details").merge(data)    
    populate_page_with data
    self.coupon_start_date = Date.today
    self.coupon_end_date = Date.today + 1
    fill_promo_description
  end

  def sign_in
    div = @browser.find_element(:id => 'merchant_sign_in_popup')
    span = div.find_element(:class => 'main-button-orange')
    span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def check_inline_errors?(msg)
    self.error_message_elements.collect(&:text).include?(msg)
  end

  def fill_promo_description
    @browser.switch_to.frame "discount_coupon_description_ifr"
    body = @browser.find_element(:id => "tinymce")
    body.send_keys "You can get two deals with one......"
    @browser.switch_to.default_content
  end

  def partial_populate_promo(data = {})
    data = data_for("merchant_details/merchant_promo_details").merge(data)    
    populate_page_with data
  end
  
  def subscription_info?
    self.merchant_notice != ""
  end

end