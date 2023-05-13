class AasmFieldSerializer < ActiveModel::Serializer
  attributes :id, :aasm_field, :human_aasm_field, :possible_events
end
