class SharedPage
  include PageObject
  include UrlHelper

  div(:flash_notice, :class => "notice")
  
end