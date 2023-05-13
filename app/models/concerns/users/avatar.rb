# frozen_string_literal: true

module Users
  # Include to user model avatar related functionality
  module Avatar
    extend ActiveSupport::Concern

    included do
      has_one_attached :avatar

      class << self
        def variants
          {
            thumbnail: { resize: '500x500' }
          }
        end
      end

      def avatar_variant(size)
        avatar.variant(User.variants[size]).processed
      end

      def avatar_url
        return unless avatar.attached?

        "#{ENV['HOST']}#{Rails.application.routes.url_helpers.rails_blob_path(avatar,
                                                                              only_path: true)}"
      end

      def avatar_thumbnail_url
        "#{ENV['HOST']}#{Rails.application.routes.url_helpers.rails_representation_url(avatar_variant(:thumbnail).processed,
                                                                                       only_path: true)}"
      end
    end
  end
end
