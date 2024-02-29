require 'rails_helper'

RSpec.describe CurrencyExchangerService do
  describe '.perform_rate' do
    let(:exchange_rates) do
      {
        'USD' => 30.15,
        'JPY' => 0.25,
        'EUR' => 32.26,
        'AUD' => 22.75,
        'SGD' => 13.32
      }
    end

    before do
      allow(described_class).to receive(:get_exchange_rates).and_return(exchange_rates)
      allow(File).to receive(:exist?).and_return(true)
      allow(File).to receive(:open)
    end

    it 'fetches exchange rates and writes them to file' do
      expect(described_class).to receive(:write_data).with(exchange_rates)
      described_class.perform_rate
    end

    it 'overwrite the file if it already exists' do
      expect(File).to receive(:open).with('app/client/lucky-app/public/rate_data.js', 'w')
      described_class.perform_rate
    end

    it 'writes data to file' do
      expect(File).to receive(:open).with('app/client/lucky-app/public/rate_data.js', 'w')
      described_class.perform_rate
    end
  end
end
