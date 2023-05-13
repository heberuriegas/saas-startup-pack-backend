# TODO: Don't camelize automatically
# https://graphql-ruby.org/fields/introduction#field-parameter-default-values
module Types
  class Attachment < GraphQL::Schema::Object
    field :id, String, null: false
    field :url, String, null: false
    field :small_url, String, null: true, camelize: false
    field :medium_url, String, null: true, camelize: false
    field :thumbnail_url, String, null: true, camelize: false
    field :blob, BlobType, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false, camelize: false
  end
end