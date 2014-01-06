And(/^I close the subscription popup$/) do
  on(SigninPage).close_subscription
end

Then(/^I should see search form$/) do
  expect(on(Search).search_form?).to eq(true)
end

And(/^I enter "([^\"]*)" in search field$/) do |text|
  on(Search).search_field
  on(Search).search_field = text
  @current_page.wait_until do
    @current_page.search_title? && @current_page.search_result_link?
  end
end

Then(/^I should see search suggestions$/) do
  expect(@current_page.search_title? && @current_page.search_title == "Deals" && @current_page.search_result_link?).to eq(true)
end

And(/^I click auto suggest serach result$/) do
  @current_page.search_result_link 
end

Then(/^I should be on deal details page$/) do
  expect(@current_page.detail_page_header? && @current_page.search_result_title? && @current_page.search_result_title == "Limited - Time offer").to eq(true)
end

And(/^I click search button$/) do
  on(Search).search
end

Then(/^I should see search results containing "(.*?)" word$/) do |arg1|
  expect(@current_page.search_text? && @current_page.search_text.include?(arg1)).to eq(true)
end

Then(/^I should see suggestion to modify search$/) do
  expect(@current_page.suggestion_for_search? && @current_page.no_results?).to eq(true)
end


