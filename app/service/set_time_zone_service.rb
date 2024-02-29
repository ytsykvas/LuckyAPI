# frozen_string_literal: true

class SetTimeZoneService
  def initialize(params)
    @params = params
  end

  def get_time_zone
    time_info = { UTC: Time.now.utc }
    cities = @params[:cities]&.split(',')
    if cities.present?
      cities.each do |city|
        time_zone = ActiveSupport::TimeZone[city.strip]
        time_info[city.strip.to_sym] = if time_zone.present?
                                         Time.now.in_time_zone(time_zone).to_time
                                       else
                                         'Invalid Timezone'
                                       end
      end
    end
    time_info
  end
end
