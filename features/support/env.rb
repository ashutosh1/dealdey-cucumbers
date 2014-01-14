$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib/pages/'))

require 'rubygems'
require 'rspec/expectations'
require "selenium-webdriver"
require 'page-object'
require 'page-object/page_factory'
require 'require_all'

require_all './lib/shared/*.rb'
require_all './lib/pages/*.rb'

World(PageObject::PageFactory)
    
PageObject::PageFactory.routes = {
  :default => [[DealDetailPage,:visit_rencreditmax_deal], [DealDetailPage,:add_to_cart_link], [Checkout, :login_user]],
  :rencreditmax_deal_greater_than_max_limit => [[DealDetailPage,:visit_rencreditmax_deal], [DealDetailPage,:select_quantity],[DealDetailPage,:add_to_cart_link], [Checkout, :login_user]],
  :rencredit_deal => [[DealDetailPage,:visit_rencredit_deal], [DealDetailPage,:add_to_cart_link], [Checkout, :login_user]],
  :non_rencredit_deal => [[DealDetailPage,:visit_non_rencredit_deal], [Checkout,:buy_product], [Checkout, :add_to_cart]] 
}
