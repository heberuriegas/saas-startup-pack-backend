module Api
  class BaseController < ActionController::Base
    skip_forgery_protection

    rescue_from StandardError do |e|
      render json: { error: e }, status: 500
    end

    def current_user
      return unless doorkeeper_token && valid_doorkeeper_token?

      User.find(doorkeeper_token.resource_owner_id)
    end

    protected

    def authenticate_with_service_key
      hasura_service_key = ENV['HASURA_SERVICE_KEY'] || Rails.application.credentials.hasura[:service_key]
      return if request.headers['X-Hasura-Service-Key'] == hasura_service_key

      render status: 403, json: {}
    end
  end
end
