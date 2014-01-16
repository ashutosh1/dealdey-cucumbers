class MerchantAccountPage
  include PageObject

  MERCHANT_PASS_ATTR = ["Current password", "Password"]

  link(:my_subscription, :text => 'My Subscription')
  link(:password_tab, :text => 'Password')
  paragraph(:error_message, :class => 'errorMsg')

  #password tab
  text_field(:current_password, :id => "merchant_current_password")
  text_field(:new_password) do|page|
    page.div_element(:id => "update_password").when_visible.text_field_element(:id => "merchant_password")
  end
  text_field(:confirm_password, :id => "merchant_password_confirmation")
   
  def reset_updated_password
    populate_page_with data_for("merchant_details/reset_merchant_password")
    save_password
  end

  def fill_and_save_password_field(data = {})
    populate_page_with data_for("merchant_details/change_merchant_password").merge(data)
    save_password
  end

  def save_password
    @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div[2]/div[2]/div/div[2]/form/ul/li[4]/span/span/input").click
  end



end  
  