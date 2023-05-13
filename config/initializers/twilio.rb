TWILIO = Twilio::REST::Client.new(
  Rails.application.credentials.twilio[:account_sid],
  Rails.application.credentials.twilio[:auth_token]
)

TWILIO_PHONE_NUMBER = Rails.application.credentials.twilio[:phone_number]