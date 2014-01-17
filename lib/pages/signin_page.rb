class SigninPage
  include PageObject

  text_field(:email, :id => 'sign_in_email')
  text_field(:password, :id => 'sign_in_password')

  link(:forget_password_link, :text => "Forgot password?")
  link(:sign_in_link, :text => "Sign In")

  div(:sign_in_popup, :id => "signin_popup_form")
  divs(:error_message, :class => "alert")
 
  def sign_in
  	span = @browser.find_element(:class => 'signin-box-splash')
  	span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def signed_in_user(data={})
    self.sign_in_link
    self.email = data_for("users/admin_first")["email"]
    @browser.execute_script("arguments[0].focus;", password_element)
    self.password = data_for("users/admin_first")["password"]
    self.sign_in
  end

end

