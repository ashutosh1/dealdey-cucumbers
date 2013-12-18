Given(/^I visit page "([^\"]*)"$/) do |path|
  on(SharedPage).path_to_visit(path)
end

Given(/^I go to page "([^\"]*)"$/) do |path|
  on(SharedPage).path_to_visit(path)
end

Then(/^I should see flash notice "([^\"]*)"$/) do |expected_text|
  expect(on(SharedPage).flash_notice).to eq(expected_text)
end
