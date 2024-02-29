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
        if time_zone.present?
          time_info[city.strip.to_sym] = Time.now.in_time_zone(time_zone).to_time
        else
          time_info[city.strip.to_sym] = 'Invalid Timezone'
        end
      end
    end
    time_info
  end
end
