module Types
  class AasmPossibleEvents < GraphQL::Schema::Object
    field :label, String, null: false
    field :name, String, null: false
    field :type, String, null: false
  end
end