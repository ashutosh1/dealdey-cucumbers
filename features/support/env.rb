$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', '..', 'lib/pages/'))

require 'rubygems'
require "selenium-webdriver"
require 'page-object'
require 'page-object/page_factory'
require 'require_all'

require_all '/home/ashutosh/dealdey-cucumbers/lib/pages/*.rb'

World(PageObject::PageFactory)
	
