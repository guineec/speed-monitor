Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV.fetch('REDIS_URL') }
end

cron_file = 'config/sidekiq-cron.yml'
if File.exist?(cron_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(cron_file)
end
