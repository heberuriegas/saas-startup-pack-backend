# frozen_string_literal: true

module Users
  # User methods related to roles
  module Roles
    extend ActiveSupport::Concern

    included do
      delegate :can?, :cannot?, to: :ability

      enumerize :role, in: [:admin, :user], predicates: { prefix: true }, default: :user

      private

      def ability
        @ability ||= Ability.new(self)
      end
    end
  end
end
