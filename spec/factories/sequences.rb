# frozen_string_literal: true

require 'securerandom'
require 'nanoid'

FactoryBot.define do
  sequence :random_boolean do
    [false, true].sample
  end

  sequence :uuid do
    SecureRandom.hex(4)
  end

  sequence :random_number_id do
    Nanoid.generate(alphabet: '0123456789')
  end

  sequence :random_string do
    Nanoid.generate
  end

  sequence :random_name do
    FFaker::Name.name
  end

  sequence :random_first_name do
    FFaker::Name.first_name
  end

  sequence :random_last_name do
    FFaker::Name.last_name
  end

  sequence :random_number do
    rand(0...101)
  end

  sequence :random_amount do
    rand(1000...500_000)
  end

  sequence :random_word do
    FFaker::Lorem.word
  end

  sequence :random_words do
    FFaker::Lorem.words.join(' ')
  end

  sequence :random_sentence do
    FFaker::Lorem.sentence
  end

  sequence :random_paragraph do
    FFaker::Lorem.paragraph
  end

  sequence :random_currency do
    'mxn'
  end

  sequence :random_quantity do
    rand(0...101)
  end

  sequence :random_unit do
    1
  end

  sequence :random_price do
    rand(15.0...101.0)
  end

  sequence :random_weight do
    rand(0.0...10.0)
  end

  sequence :image_url do
    nil
  end

  sequence :random_store_coordinates do
    lng = FFaker::Geolocation.lng
    lat = FFaker::Geolocation.lat
    "#{lat},#{lng}"
  end

  sequence :random_phone_number do
    FFaker::PhoneNumber.short_phone_number
  end

  sequence :random_mexican_phone_number_without_country_code do
    FFaker::PhoneNumberMX.phone_number.gsub(' ', '')
  end

  sequence :random_date do
    Time.now
  end

  sequence :random_before_date do
    Time.now - rand(1...101).days
  end

  sequence :random_after_date do
    Time.now + rand(1...101).days
  end

  sequence :random_email do
    FFaker::Internet.email
  end

  sequence :random_hex do
    SecureRandom.hex
  end

  sequence :current_timestamp do
    Time.now.to_i
  end

  sequence :random_country do
    FFaker::Address.country
  end

  sequence :random_address do
    FFaker::Address.street_address
  end

  sequence :random_coordinates do
    [FFaker::Geolocation.lat, FFaker::Geolocation.lng].join(', ')
  end

  sequence :random_url do
    FFaker::Internet.http_url
  end
end
