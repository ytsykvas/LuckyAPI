# frozen_string_literal: true

When(/I visit our page/) do
  visit 'http://localhost:5173/'
end

When(/I check (.*?) checkbox/) do |city|
  find("input[type=\"checkbox\"][value=\"#{city}\"]").check
end

When(/I click the "(.*?)" button/) do |button_name|
  button_test_id = {
    'submit timezone': 'submit-cities',
    'submit exchange': 'submit-exchange'
  }
  object = button_test_id[button_name.to_sym]
  find("[data-test-id='#{object}']").click
end

When(/I fill "(.*?)" in the (.*?) (field|select box)/) do |text, field_test_id, type|
  hash_of_data_test_id = {
    'currency': 'currency-select',
    'amount': 'currency-amount'
  }.stringify_keys

  input_element = find("[data-test-id='#{hash_of_data_test_id[field_test_id.downcase]}']")
  if type == 'field'
    input_element.fill_in(with: text)
  elsif type == 'select box'
    input_element.select(text)
  end
end

When(/^I enter "([^"]*)" amount$/) do |amount|
  fill_in('Amount', with: amount)
end
