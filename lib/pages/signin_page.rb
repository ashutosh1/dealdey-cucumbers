class SigninPage
  include PageObject

  text_field(:email, :id => 'sign_in_email')
  text_field(:password, :id => 'sign_in_password')

  link(:forget_password_link, :text => "Forgot password?")
  link(:close_subscription, :class => 'no-subscription')
  link(:sign_in_link, :text => "Sign In")

  div(:sign_in_popup, :id => "signin_popup_form")
 
  def sign_in
  	span = @browser.find_element(:class => 'signin-box-splash')
  	span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  def signed_in_user(data={})
    self.sign_in_link
    populate_page_with data_for("users/admin_first")
    self.sign_in
  end

end

