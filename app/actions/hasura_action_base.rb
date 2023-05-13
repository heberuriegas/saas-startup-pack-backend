class HasuraActionBase < HasuraHandler::Action
  include ThreadUtils

  def current_user
    @user ||= User.find_by(id: @session_variables['x-hasura-user-id'])
  end

  def run
    begin
      do_with_current_user(current_user) do
        yield
      end
    rescue StandardError => e
      Rails.logger.error e.message
      Rails.logger.error e.backtrace.join("\n")
      @error_message = { error: e.message }.to_json
    end
  end

  def params
    ActionController::Parameters.new(@input.deep_symbolize_keys)
  end
end