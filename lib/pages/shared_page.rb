class SharedPage
  include PageObject
  include UrlHelper
  include InlineErrorHelper

  div(:flash_notice, :class => "notice")
  div(:flash_error, :class => "error")
  div(:flash_alert, :class => "alert")
  paragraphs(:inline_error_message, :class => 'errorMsg')
  
end