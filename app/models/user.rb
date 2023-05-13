# frozen_string_literal: true

# Represt a user
class User < ApplicationRecord
  extend Enumerize

  include Users::Auth
  include Users::OAuth2
  include Users::Roles
  include Users::Avatar

  has_many :devices

  scope :active, -> { where(is_active: true) }
end
