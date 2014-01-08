class MerchantSignupPage
  include PageObject
  MERCHANT_ATTR = ["Business name", "Location", "Phone", "Email", "Category", "Contact person", "Business description"]

  link(:register_as_merchant, :text => "Register as a Merchant")
  link(:sign_up, :href => "/get_featured", :class => "signup")
  link(:sign_in_link, :class => "signin_link")
  paragraphs(:error_message, :class => 'errorMsg')

  #merchant sign in form
  div(:merchant_sign_in_div, :id => "merchant_sign_in_popup")
  divs(:error_message, :class => "error")
  div(:promo_offer_div, :class => "promo_offer")
  form(:merchant_signin_form, :id => 'new_merchant')
  text_field(:merchant_email, :id => "merchant_email")
  text_field(:merchant_password, :id => "merchant_password")

  #merchant sign up form
  form(:merchant_signup_form, :id => 'merchant-contact-register-form')
  text_field(:phone, :id => "merchant_phone")
  text_field(:email, :id => "merchant_email")
  text_field(:location, :id => "merchant_location")
  select_list(:category, :id => "merchant_category")
  text_field(:business_name, :id => "merchant_business_name")
  text_field(:contact_person, :id => "merchant_contact_person")

  text_area(:business_description, :id => "merchant_business_description")

  radio_button(:offer_deal, :id => "merchant_offer_deal_true")
  radio_button(:offer_promo, :id => "merchant_offer_deal_false")

  #if offer promo
  text_field(:website, :id => "merchant_website")
  file_field(:logo_file, :id => 'merchant_logo')

  #if offer deal
  text_field(:deal_description, :id => "merchant_deal_description")
  text_field(:deal_price, :id => "merchant_deal_price")
  text_field(:deal_discount, :id => "merchant_deal_discount")
  
  def submit_form
    @browser.find_element(:xpath => "/html/body/div[2]/div[6]/div[2]/div[2]/div/div[2]/div[2]/form/div[13]/span/input").click
  end

  def signin_and_signup_links?
	  self.sign_up? && self.sign_in?
  end

  def check_errors?(val)
	  self.error_message_elements.collect(&:text).include?(val + " can't be blank")
  end

	def populate_merchant(data = {})
	  data = data_for("merchant_details/first").merge(data)
	  populate_page_with data
    self.category_element[1].click
  end

  def check_inline_errors?(msg)
    self.error_message_elements.collect(&:text).include?(msg)
  end

  def sign_in
    div = @browser.find_element(:id => 'merchant_sign_in_popup')
    span = div.find_element(:class => 'main-button-orange')
    span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def populate_merchant_signup_form(data = {})
    data = data_for("merchant_details/merchant_signin_credential").merge(data)
    populate_page_with data
    sign_in
  end


end