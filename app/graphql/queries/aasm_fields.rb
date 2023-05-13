module Queries
  module AasmFields
    class AasmFieldsAttributes < Types::BaseInputObject
      description "Get available operations for a specific aasm state attribute in a model"
      argument :record_id, Types::BigInt, "Model instance id", required: true, camelize: false
      argument :record_type, String, "Model class name", required: true, camelize: false
      argument :attribute, String, "Model attribute name", required: true
    end

    def self.included(c)
      # attach the field here
      c.field :aasm_field, Types::AasmField, null: true, description: "File relation for active storage models", camelize: false do
        argument :input, AasmFieldsAttributes, required: true
      end
    end
  
    def aasm_field(input:)
      klass = input.record_type.constantize
      
      if klass.respond_to?(:aasm) && klass.aasm.attribute_name == input.attribute.to_sym

        instance = klass.find(input.record_id)

        if context[:current_user].present? && context[:current_user].can?(:read, instance)
          instance.send(input.attribute)
          AasmFieldSerializer.new(instance).as_json
        end    
      end
    end
  end
end