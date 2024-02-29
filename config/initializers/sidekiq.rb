# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq-cron'

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path('config/sidekiq_schedule.yml', __dir__))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end
