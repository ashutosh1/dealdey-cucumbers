class UserAccountPage
  include PageObject
  SHIPPING_ADDRESS_ATTRIBUTES = ["Name", "Address line", "State", "Area"]

  list_item(:user_account, :class => 'user')
  link(:account, :class => 'dropdown')
  link(:settings, :class => 'settings')
  link(:address_tab, :text => 'Addresses')
  link(:password_tab, :text => 'Password')
  link(:edit, :class => 'edit')
  link(:delete, :text => 'Delete')
  link(:select_none, :class => 'select_none')
  
  #password update
  text_field(:current_password, :id => "user_current_password")
  text_field(:new_password, :id => "user_password")
  text_field(:confirm_password, :id => "user_password_confirmation")
  paragraph(:error_message, :class => 'errorMsg')

  #address tab
  text_field(:shipping_address_name, :id => "shipping_address_name")
  text_field(:address_line, :id => "shipping_address_address_line")
  select_list(:state, :id => "shipping_address_state")
  select_list(:area, :id => "area_list")
  #for edit a existing address
  text_field(:address_name) do|page|
    page.div_element(:class => "address_form").when_visible.text_field_element(:id => "shipping_address_name")
  end

  button(:save_updated_address) do|page|
    page.div_element(:class => "address_form").when_visible.button_element(:class => "savebut")
  end

  #profile tab
  text_field(:firstname, :id => "user_firstname")
  text_field(:lastname, :id => "user_lastname")
  text_field(:mobile, :id => "user_mobile")
  form(:profile_form, :class => 'edit_user')
  form(:news_letter_form, :id => 'manage_subscription_form')
  checkbox(:news_letter_checkbox, :id => "state_ids_")

  select_list(:gender, :id => "user_gender")
  select_list(:age, :id => "user_age_bracket")
  select_list(:profession, :id => "user_profession")
  select_list(:salary, :id => "user_salary_bracket")

  def update_profile
    populate_page_with data_for("users/user_update_data")
    self.gender_element[2].click
    self.age_element[2].click
    save_profile
  end

  def save_news_letter
    span = @browser.find_element(:class => "button_group")
    span.find_element(:name => "commit", :type => "submit", :value => "save").click
  end

  def save_profile
    li = @browser.find_element(:class => "button")
    li.find_element(:name => "commit", :type => "submit", :value => "save", :class => "savebut").click
  end
  
  def populate_user_profile(data = {}, pass_attr)
    populate_page_with data_for("users/user_update_data").merge(data)
    save_profile
  end

  def checkbox_checked?
    self.news_letter_checkbox_checked?
  end

  def add_new_address
    populate_page_with data_for("address/new_shipping_address")
    self.state_element[2].click
    sleep(2)
    self.area_element[2].click
    save_address
  end

  def save_address
    @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div[2]/div[2]/div[3]/form/div[3]/button").click
  end

  def update_address
    self.address_name = data_for("address/update_shipping_address")["shipping_address_name"]
    save_updated_address_element.click
  end

  def reset_update_password
    populate_page_with data_for("users/reset_user_password")
    save_password
  end

  def fill_and_save_password_field(data = {})
    populate_page_with data_for("users/change_user_password").merge(data)
    save_password
  end
  
  def save_password
    @browser.find_element(:xpath => "/html/body/div[2]/div[4]/div[2]/div[2]/div[3]/form/ul/li[4]/input").click
  end
  
end