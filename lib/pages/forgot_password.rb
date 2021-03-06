class ForgotPassword
  include PageObject

  div(:forget_password_page, :class => "forgotPassword")
  
  text_field(:user_email_for_resend, :xpath => '/html/body/div[2]/div[6]/div[2]/div/form/ul/li/input')
  paragraph(:error_in_email_for_resend_instruction, :class => 'errorMsg')
  
  def fill_email(email)
    self.user_email_for_resend = email
  end

  def resend_password_instruction
    span = @browser.find_element(:class => 'btnGreen')
    span.find_element(:name => "commit", :value => "Send me reset password instructions", :type => "submit").click
  end
end

