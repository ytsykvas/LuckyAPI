# frozen_string_literal: true

Then(/^I see text: (.+)/) do |text|
  expect(page).to have_text(text)
end

Then(/^I see symbols "([^"]*)" in the currency table$/) do |symbols|
  expected_symbols = symbols.split(',')
  actual_symbols = all('.currency-table tbody td:first-child').map(&:text)

  expected_symbols.each do |symbol|
    expect(actual_symbols).to include(symbol)
  end
end

Then(/^I should see result "([^"]*)"$/) do |result|
  expect(page).to have_content(result)
end

Then(/I see correct result of exchange of "(.*?)" in amount of "(.*?)"/) do |currency, amount|
  rate_data = File.read('app/client/lucky-app/public/rate_data.js')
  rate = rate_data.match(/"#{currency}":(\d+\.\d+)/)[1].to_f
  exchange_result = (rate * amount.to_f).round(2)
  expect(page).to have_text("You will get: #{exchange_result}")
end
