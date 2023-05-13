class HealthController < ActionController::Base
    def index
      status = 200
      
      is_active_database = ActiveRecord::Base.connection.active?
      is_active_sidekiq, sidekiq_data = sidekiq
  
      status = 503 unless is_active_sidekiq && is_active_database
  
      render status: status, json: {
        status: status,
      }
    end
  
    private
    def sidekiq
      processes = Sidekiq::ProcessSet.new
      [processes.count > 0, processes]
    rescue => e
      [false, {
        message: e.message,
        backtrace: e.backtrace,
      },]
    end
  end