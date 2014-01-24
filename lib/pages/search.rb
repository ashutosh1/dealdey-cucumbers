class Search
  include PageObject
  CATEGORY = ["Bestsellers", "City & Travel", "Fashion", "Gadgets & Electronics", "Home & Decor", "Baby & Kids"]
  text_field(:search_field, :id => 'search')
  form(:search_form, :id => 'searchForm')
  div(:search_deals_div, :id => 'searched_deals')
  div(:deals_div, :id => 'deals')
  div(:search_page, :id => 'search_page')
  div(:search_text, :class => 'subCat')
  
  h2(:search_header, :class => 'search')
  h3(:search_result_header, :class => 'title')
  h1(:detail_page_header, :class => 'title')
  h5(:no_results, :xpath => '/html/body/div[2]/div[6]/div[2]/h5')
  
  span(:best_seller) do|page|
    page.div_element(:class => "city_deals").span_element(:text => "Bestsellers")
  end
  unordered_lists(:search_results) do |page|
    page.div_element(:class => "deals").div_element(:class => "city_deals").unordered_list_element(:id => "all_category_deals")
  end
  spans(:all_categories, :class => "text")
  span(:search_title, :class => 'title')
  span(:search_result_title, :class => 'left_title')
  link(:search_result_link, :text => 'Limited - Time offer')
  
  
  def search
    @browser.find_element(:xpath => "/html/body/div[2]/div[2]/div[2]/div[3]/div/form/input[2]").click
  end

  def all_categories?(txt)
    all_categories_elements.collect(&:text).include?(txt)
  end
end

