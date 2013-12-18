class SigninPage
  include PageObject

  text_field(:sign_in_email, :id => 'sign_in_email')
  text_field(:sign_in_password, :id => 'sign_in_password')

  link(:forget_password_link, :text => "Forgot password?")
  link(:close_subscription, :class => 'no-subscription')
  link(:sign_in_link, :text => "Sign In")

  div(:sign_in_popup, :id => "signin_popup_form")
  div(:error_message, :class => "alert")
  div(:flash_notice, :class => "notice")
 
  def sign_in
  	span = @browser.find_element(:class => 'signin-box-splash')
  	span.find_element(:name => "commit", :value => "Sign in", :type => "submit").click
  end

  
end

