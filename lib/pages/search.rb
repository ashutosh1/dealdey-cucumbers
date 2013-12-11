class Search
  include PageObject
  
  text_field(:search_field, :id => 'search')
  form(:search_form, :id => 'searchForm')
  div(:search_deals_div, :id => 'searched_deals')
  div(:deals_div, :id => 'deals')
  div(:search_page, :id => 'search_page')
  div(:search_text, :id => 'subCat')
  
  h2(:search_header, :class => 'search')
  h3(:search_result_header, :class => 'title')
  h1(:detail_page_header, :class => 'title')
  h5(:no_results, :xpath => '/html/body/div[2]/div[6]/div[2]/h5')
  h4(:suggestion_for_search, :xpath => '/html/body/div[2]/div[6]/div[2]/h4')
  
  span(:search_title, :class => 'title')
  span(:search_result_title, :class => 'left_title')
  link(:search_result_link, :text => 'Limited - Time offer')
  
  
  def search
    @browser.find_element(:xpath => "/html/body/div[2]/div[2]/div[2]/div[3]/div/form/input[2]").click
  end
end

