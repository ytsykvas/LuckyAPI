# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SetTimeZoneService do
  describe '#get_time_zone' do
    context 'with valid parameters' do
      let(:valid_params) { { cities: 'Hawaii,London,Fiji,Athens,Hanoi,Santiago,Edinburgh,Sydney,Kyiv,Zurich' } }

      it 'returns a hash with time zone information' do
        service = SetTimeZoneService.new(valid_params)
        time_info = service.get_time_zone

        expect(time_info).to be_a(Hash)
        expect(time_info[:UTC]).to be_a(Time)

        valid_cities = valid_params[:cities].split(',')
        valid_cities.each do |city|
          city_key = city.strip.to_sym
          expect(time_info[city_key]).to be_a(Time)
        end
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { cities: 'InvalidCity1,InvalidCity2' } }

      it 'returns a hash with "Invalid Timezone" for invalid cities' do
        service = SetTimeZoneService.new(invalid_params)
        time_info = service.get_time_zone

        expect(time_info).to be_a(Hash)
        expect(time_info[:UTC]).to be_a(Time)

        invalid_cities = invalid_params[:cities].split(',')
        invalid_cities.each do |city|
          city_key = city.strip.to_sym
          expect(time_info[city_key]).to eq('Invalid Timezone')
        end
      end
    end
  end
end
