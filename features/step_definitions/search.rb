Then(/^I should see search form$/) do
  expect(on(Search).search_form?).to eq(true)
end

And(/^I enter "([^\"]*)" in search field$/) do |text|
  on(Search).search_field_element.focus
  on(Search).search_field = text
  if text != "xyxyxyxyxyxyxyx"
    @current_page.wait_until do
      @current_page.search_title? && @current_page.search_result_link?
    end
  end
end

Then(/^I should see search suggestions$/) do
  expect(@current_page.search_title? && @current_page.search_title == "Deals" && @current_page.search_result_link?).to eq(true)
end

And(/^I click autosuggest serach result$/) do
  @current_page.search_result_link 
end

Then(/^I should be on deal details page$/) do
  expect(@current_page.detail_page_header? && @current_page.search_result_title? && @current_page.search_result_title == "Limited - Time offer").to eq(true)
end

And(/^I click search button$/) do
  on(Search).search
end

Then(/^I should see search text "(.*?)"$/) do |arg1|
  expect(@current_page.search_text? && @current_page.search_text.include?(arg1)).to eq(true)
end

Then(/^I should see search results$/) do
  expect(@current_page.search_results_elements.count).to be >= 1
end

Then(/^I should see all categories section$/) do
  Search::CATEGORY.each do|txt|
    expect(@current_page.all_categories?(txt)).to eq(true)
  end
end

And(/^I search with "(.*?)"$/) do |text|
  on(Search).search_field_element.focus
  on(Search).search_field = text
  on(Search).search
end


