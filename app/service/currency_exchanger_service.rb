require 'uri'
require 'net/http'
require 'dotenv/load'

class CurrencyExchangerService
  include Sidekiq::Worker

  def self.perform_rate
    write_data(get_exchange_rates)
  end

  private_class_method def self.get_exchange_rates
    currencies = %w[USD JPY EUR AUD SGD]
    exchange_rates = {}

    currencies.each do |currency|
      url = URI("#{ENV['API_URL']}?from=#{currency}&to=UAH&q=1.0")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request['X-RapidAPI-Key'] = ENV['RAPIDAPI_KEY']
      request['X-RapidAPI-Host'] = ENV['RAPIDAPI_HOST']

      response = http.request(request)
      if response.code == '200' && JSON.parse(response.body).present?
        exchange_rates[currency] = JSON.parse(response.body)
      else
        exchange_rates[currency] = 'Error with rate'
        puts "Error fetching exchange rate for #{currency}: #{response.code}"
      end
    end

    exchange_rates
  rescue StandardError => e
    puts "Error fetching exchange rates: #{e.message}"
  end

  def self.write_data(rates)
    File.open('app/client/lucky-app/public/rate_data.js', 'w') do |file|
      file.puts "export const rates = #{JSON.generate(rates)};"
    end
  end
end
