class SubscriptionPopup
  include PageObject

  link(:close_subscription, :class => 'no-subscription')
  div(:subscription_popup, :id => 'new_city_select')
  select_list(:select_state, :id => 'email_subscription_state_id')
  text_field(:subscription_email, :id => 'email_subscription_email')
  span(:pod_text, :class => 'pod')
  span(:call, :class => 'call')
  unordered_list(:header_link, :class => 'header-links')
  list_item(:sign_in, :class => 'signin')
  list_item(:sign_up, :class => 'signup')
  link(:sign_in_link, :text => "Sign In")
  link(:sign_up_link, :text => "Sign Up")
  h2(:subscription_notice, :xpath => '//*[@id="wrapper"]/div[6]/div[2]/div[1]/h2')
  div(:error_message, :class => "error")

  def register
  	popup = @browser.find_element(:class => 'new_email_subscription')
  	popup.find_element(:name => "commit", :value => "Subscribe Now", :type => "submit").click
  end


end
