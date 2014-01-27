Then(/^I should see "([^\"]*)" in footer$/) do |expected_text|
  expect(on(FooterLinkPage).footer_div_element.text).to include(expected_text)
end

Then(/^I should see social links to follow:$/) do|table|
  data = table.hashes[0]
  data["social_links"].split.each do|social_link|
    expect(on(FooterLinkPage).send("#{social_link}?")).to eq(true)
  end
end

Then(/^I should see avilable payment options:$/) do|table|
  data = table.hashes[0]
  data["payment_options"].split.each do|payment_option|
    expect(on(FooterLinkPage).send("#{payment_option}?")).to eq(true)
  end
end

Then(/^I should see other links:$/) do|table|
  data = table.hashes[0]
  data["other_links"].split.each do|other_link|
    expect(on(FooterLinkPage).send("#{other_link}?")).to eq(true)
  end
end

And(/^I click "([^\"]*)" in footer$/) do |expected_text|
  on(FooterLinkPage).send(expected_text.downcase.split.join("_"))
end

Then(/^I click links and see respective pages:$/) do|table|
  data = table.hashes
  data.each do |hash|
    on(FooterLinkPage).send(hash["Click Links"].downcase.split.join("_"))
    on(FooterLinkPage).wait_until do 
      step "I should see \"#{hash['pages']}\""
    end    
  end
end

Then(/^I should be on dealdeyholic blog page$/) do
  aw = @browser.window_handles
  @browser.switch_to.window(aw[1])
  expect(on(FooterLinkPage).dealdeyholic_blog_image?).to eq(true)
  @browser.switch_to.window(aw[0])
end

Then(/^I should see "([^\"]*)" in new tab$/) do |expected_text|
  aw = @browser.window_handles
  @browser.switch_to.window(aw[1])
  step "I should see \"#{expected_text}\""
  @browser.switch_to.window(aw[0])
end