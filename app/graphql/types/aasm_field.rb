module Types
  class AasmField < GraphQL::Schema::Object
    field :id, Int, null: false
    field :aasm_field, String, null: false, camelize: false
    field :human_aasm_field, String, null: false, camelize: false
    field :possible_events, [Types::AasmPossibleEvents], null: false, camelize: false
  end
end