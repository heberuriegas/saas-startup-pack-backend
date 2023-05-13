module Mutations
  class CreateAttachments < BaseMutation
    # argument :input, Types::AttachFilesAttributes, required: true
    argument :related_id, Int, required: true, camelize: false
    argument :related_type, String, required: true, camelize: false
    argument :attribute, String, required: true
    argument :signed_ids, [String], required: true, camelize: false

    class CreateAttachmentsOutput < GraphQL::Schema::Object
      field :attachments, [Types::Attachment], null: false
    end

    type CreateAttachmentsOutput
  
    def resolve(input)
      related_id, related_type, attribute, signed_ids = input.values_at(:related_id, :related_type, :attribute, :signed_ids)

      resource = related_type.constantize.find(related_id)

      if context[:current_user].can? :update, resource
        if resource.update!(attribute => signed_ids)
          {
            attachments: ActiveModel::Serializer::CollectionSerializer.new(
              resource.send(attributes),
              serializer: AttachmentSerializer
            ).as_json
          }
        end
      else
        raise AuthorizationError
      end
    end
  end
end