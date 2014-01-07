class SharedPage
  include PageObject
  include UrlHelper

  div(:flash_notice, :class => "notice")
  div(:flash_error, :class => "error")
  div(:flash_alert, :class => "alert")
  
end