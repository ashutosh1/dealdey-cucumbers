Given(/^I visit page "([^\"]*)"$/) do |path|
  on(SharedPage).path_to_visit(path)
end

Given(/^I go to page "([^\"]*)"$/) do |path|
  on(SharedPage).path_to_visit(path)
end

Then(/^I should see flash notice "([^\"]*)"$/) do |expected_text|
  expect(on(SharedPage).flash_notice).to eq(expected_text)
end

Then(/^I should see flash error "([^\"]*)"$/) do |expected_text|
  expect(on(SharedPage).flash_error).to eq(expected_text)
end

Then(/^I should see flash alert "([^\"]*)"$/) do |expected_text|
  expect(on(SharedPage).flash_alert).to eq(expected_text)
end
