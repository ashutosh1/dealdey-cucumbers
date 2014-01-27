class FooterLinkPage
  include PageObject
  link(:dealdeyholic_blog, :text => "The DealDeyholic Blog")
  link(:conditions_policy, :href => "/delivery_return_refund_and_cancellation_policy")
  link(:register_as_a_merchant, :text => "Register as a Merchant")
  link(:toi_dealdey, :text => "Times of India for DealDeyy")
  link(:faq, :text => "FAQ")
  image(:dealdeyholic_blog_image, :class => 'header-image')

  PAYMENT_OPTIONS = ["mastercard", "visa", "verve", "gtb", "zenith", "access", "paga", "rencredit", "pod"]
  FOOTER_LINKS = ["about_us", "contact_us", "how_it_works", "terms_of_use", "privacy_policy" ]
  SOCIAL_LINKS = ["gplus-link", "pinterest-link", "twitter-link", "fb-link"]
  
  PAYMENT_OPTIONS.each do |pay_option|
    div(pay_option.to_sym) do|page|
      page.div_element(:id => "footer").div_element(:class => pay_option)
    end  
  end

  FOOTER_LINKS.each do |foot_link|
    link(foot_link.to_sym) do|page|
      page.div_element(:id => "footer").link_element(:text => foot_link.gsub("_", " ").split.map(&:capitalize).join(" "))
    end  
  end

  SOCIAL_LINKS.each do |social_link|
    link(social_link.gsub("-","_").to_sym) do |page|
      page.div_element(:id => "footer").div_element(:class => "follow").link_element(:class => social_link)
    end
  end
  
  div(:call_footer, :class => "call-footer")
  div(:footer_div, :id => "footer")
end