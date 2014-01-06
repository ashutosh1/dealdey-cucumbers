class SignupPage
  include PageObject
  DEFAULT_ATTR = ["Firstname", "Lastname", "Email", "Mobile", "Gender","Age bracket", "Password"]
  DEFAULT_USER = {
    "firstname" => "Dealdey",
    "lastname" => "cucumber",
    "email" => "cucks9@example.com",
    "mobile" => "08119786160",
    "gender" => "Male",
    "age_bracket" => "18-25",
    "password" => "deal123",
    "password_confirmation" => "deal123" 
  }

  text_field(:firstname, :id => 'user_firstname')
  text_field(:lastname, :id => 'user_lastname')
  text_field(:email, :id => 'user_email')
  text_field(:mobile, :id => 'user_mobile')
  text_field(:password, :id => 'user_password')
  text_field(:password_confirmation, :id => 'user_password_confirmation')

  select_list(:gender, :id => 'user_gender')
  select_list(:age_bracket, :id => 'user_age_bracket')

  list_item(:register, :class => 'register')

  link(:already_registered, :text => "Already a member? Sign In.")
  link(:fb_login, :class => "signinBtnFB")
  link(:sign_up_link, :text => "Sign Up")

  paragraph(:error_message, :class => 'errorMsg')
  links(:error_message_para, :class => 'errorMsg')

  def sign_up
    popup = @browser.find_element(:class => 'register')
    popup.find_element(:name => "commit", :value => "Register", :type => "submit").click
  end

  def populate_user(data = {})
    data = DEFAULT_USER.merge(data)
    self.firstname = data['firstname']
    self.lastname = data['lastname']
    self.email = data['email']
    self.mobile = data['mobile']
    self.gender = data['gender']
    self.age_bracket = data['age_bracket']
    self.password = data['password']
    self.password_confirmation = data['password_confirmation']
  end

  def check_errors?(val)
    self.error_message_para_elements.collect{|i| i.text}.include?(val + " can't be blank")
  end
  
end