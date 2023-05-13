# frozen_string_literal: true

module Users
  # Include to user OAuth related methods
  module OAuth2
    extend ActiveSupport::Concern

    # rubocop:disable Metrics/BlockLength
    included do
      has_many :access_grants,
               class_name: 'Doorkeeper::AccessGrant',
               foreign_key: :resource_owner_id,
               dependent: :destroy

      has_many :access_tokens,
               class_name: 'Doorkeeper::AccessToken',
               foreign_key: :resource_owner_id,
               dependent: :destroy

      has_many :identities,
               class_name: 'OAuth2::Identity',
               dependent: :destroy

      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/CyclomaticComplexity
      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/PerceivedComplexity
      def self.from_identity(options = {})
        uid = options[:uid] || options[:id] || options[:user_id]
        provider = options[:provider]
        email = options[:email]
        name = options[:name] || (options[:first_name] || options[:last_name] ? "#{options[:first_name]} #{options[:last_name]}" : nil)

        raise 'Uid is not present' unless uid.present?
        raise 'Provider is not present' unless provider.present?

        identity = OAuth2::Identity.find_by(uid: uid, provider: provider)
        unless identity.present?
          identity = OAuth2::Identity.new(uid: uid, provider: provider)

          user = options[:email].present? ? User.find_by(email: options[:email]) : nil
          if user.nil?
            user = User.create(name: name, email: email, identities: [identity])
          else
            identity.user = user
            identity.save
          end
        end
        identity.user
      end
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/CyclomaticComplexity
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/PerceivedComplexity
    end
  end
end
