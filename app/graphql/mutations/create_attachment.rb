module Mutations
  class CreateAttachment < BaseMutation
    # argument :input, Types::AttachFilesAttributes, required: true
    argument :related_id, Int, required: true, camelize: false
    argument :related_type, String, required: true, camelize: false
    argument :attribute, String, required: true
    argument :signed_id, String, required: true, camelize: false

    class CreateAttachmentOutput < GraphQL::Schema::Object
      field :attachment, Types::Attachment, null: false
    end

    type CreateAttachmentOutput
  
    def resolve(input)
      related_id, related_type, attribute, signed_id = input.values_at(:related_id, :related_type, :attribute, :signed_id)
      
      resource = related_type.constantize.find(related_id)
      
      if context[:current_user].can? :update, resource
        if resource.update!(attribute => signed_id)
          {
            attachment: AttachmentSerializer.new(resource.send(attribute)).as_json
          }
        end
      else
        raise AuthorizationError
      end
    end
  end
end