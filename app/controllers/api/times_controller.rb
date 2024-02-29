module Api
  class TimesController < ApplicationController
    def index
      time_info = SetTimeZoneService.new(params).get_time_zone

      render json: time_info
    end
  end
end
