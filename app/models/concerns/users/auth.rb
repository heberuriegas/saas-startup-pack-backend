# frozen_string_literal: true

module Users
  # Include to user model auth related methods
  module Auth
    extend ActiveSupport::Concern

    # rubocop:disable Metrics/BlockLength
    included do
      has_one_time_password length: 6

      # Include default devise modules. Others available are:
      # :lockable, :timeoutable, :trackable and :omniauthable
      devise :database_authenticatable, :registerable, :recoverable,
             :rememberable, :validatable, :confirmable, :omniauthable,
             omniauth_providers: %i[],
             authentication_keys: {
               email: false,
               phone_number: false
             }

      validates :email, uniqueness: true, allow_blank: true
      validates :phone_number, uniqueness: true, allow_blank: true
      validates :username, uniqueness: true, allow_blank: true

      before_create :skip_confirmation!, if: -> { !email_required? }

      def auth_by_phone_number?
        !email_required? && phone_number.present?
      end

      def email_required?
        !(phone_number.present? || identities.present?)
      end

      alias_attribute :current_password_required?, :current_password_required

      def current_password_required
        name.present? && encrypted_password.present?
      end

      # Devise override to ignore the password requirement if the user is authenticated with Google
      def password_required?
        !email_required? ? false : super
      end

      # rubocop:disable Metrics/MethodLength
      def send_otp(options = {})
        options.reverse_merge!(via: 'sms', validation_hash: nil)
        via, validation_hash = *options.values_at(:via, :validation_hash)

        if %w[sms both].include?(via)
          message = if validation_hash.present?
                      I18n.t('back.notifications.send_sms_otp_with_hash', code: otp_code,
                                                                          validation_hash: validation_hash)
                    else
                      I18n.t('back.notifications.send_sms_otp', code: otp_code)
                    end

          Notifications::NotifySms.perform(phone_number, message)
        end

        return unless %w[whatsapp both].include?(via)

        message = I18n.t('back.notifications.send_whatsapp_otp', code: otp_code)
        Notifications::NotifyWhatsapp.perform(phone_number, message)
      end
      # rubocop:enable Metrics/MethodLength
    end
    # rubocop:enable Metrics/BlockLength
  end
end
