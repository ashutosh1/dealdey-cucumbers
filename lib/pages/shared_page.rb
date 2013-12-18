class SharedPage
  include PageObject
  include SharedMethods

  div(:flash_notice, :class => "notice")
  
end