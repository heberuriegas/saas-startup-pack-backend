class Notifications::NotifyPushNotification < Aldous::Service
  attr_reader :to, :body, :options

  def initialize(to, body, options = {})
    @to = to.is_a?(Array) ? to : [to]
    @body = body
    @options = options
  end

  def perform
    client = Exponent::Push::Client.new
    to.each_slice(100) do |recipients|
      messages = recipients.map do |to|
        {
          to: to,
          body: @body
        }.merge(options)
      end

      client.send_messages(messages)
    end

    Result::Success.new
  end
end
