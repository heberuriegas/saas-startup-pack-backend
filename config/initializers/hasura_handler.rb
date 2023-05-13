HasuraHandler.setup do |config|
  config.auth_key = ENV['HASURA_SERVICE_KEY'] || Rails.application.credentials.hasura.try(:[], :hasura_service_key)
  # config.fanout_events = false
  # config.async_events = false
end rescue Rails.logger.error "Hasura handler did not start successfully."