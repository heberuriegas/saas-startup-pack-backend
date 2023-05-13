# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { generate(:random_name) }
    password { generate(:random_string) }
    email { generate(:random_email) }
    phone_number { generate(:random_phone_number) }
    encrypted_password { generate(:random_string) }
  end

  factory :user_without_confirmation, parent: :user do
    phone_number { nil }
  end
end
