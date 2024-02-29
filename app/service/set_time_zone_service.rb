# frozen_string_literal: true

class SetTimeZoneService
  def initialize(params)
    @params = params
  end

  def get_time_zone
    time_info = { UTC: Time.now.utc }
    cities = parse_cities(@params[:cities])

    cities.each do |city|
      time_info[city.to_sym] = get_local_time(city)
    end

    time_info
  end

  private

  def parse_cities(cities)
    return [] unless cities.present?

    cities.split(',').map(&:strip)
  end

  def get_local_time(city)
    time_zone = ActiveSupport::TimeZone[city]
    if time_zone.present?
      Time.now.in_time_zone(time_zone).to_time
    else
      'Invalid Timezone'
    end
  end
end
