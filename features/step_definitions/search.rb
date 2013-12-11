Given(/^I close the subscription popup$/) do
  on(SigninPage).close_subscription
end

Then(/^I should see search form$/) do
  on(Search).search_form?
end

And(/^I enter "([^\"]*)" in search field$/) do |text|
  on(Search).search_field
  on(Search).search_field = text
end

Then(/^I should see search suggestions$/) do
  @current_page.search_title? && ( @current_page.search_title == "Deals") && @current_page.search_result_link?
end

And(/^I click auto suggest serach result$/) do
  @current_page.search_result_link 
end

Then(/^I should be on deal details page$/) do
  @current_page.detail_page_header? && @current_page.search_result_title? && @current_page.search_result_title == "Limited - Time offer"
end

And(/^I click search button$/) do
  on(Search).search
end

Then(/^I should see js error box$/) do
  
end

Then(/^I should see search results containing "(.*?)" word$/) do |arg1|
  @current_page.search_text? && @current_page.search_text == arg1 && @current_page.search_result_title?
end

Then(/^I should see suggestion to modify search$/) do
  @current_page.suggestion_for_search? && @current_page.no_results?
end


