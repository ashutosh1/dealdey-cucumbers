module InlineErrorHelper

  def check_errors?(val)
    self.inline_error_message_elements.collect(&:text).include?(val + " can't be blank")
  end

  def check_inline_errors?(msg)
    self.inline_error_message_elements.collect(&:text).include?(msg)
  end
  
end