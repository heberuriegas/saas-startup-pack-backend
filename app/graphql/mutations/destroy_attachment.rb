module Mutations
    class DestroyAttachment < BaseMutation
      argument :related_id, Int, required: true, camelize: false
      argument :related_type, String, required: true, camelize: false
      argument :attribute, String, required: true
    
      def resolve(input)
        related_id, related_type, attribute = input.values_at(:related_id, :related_type, :attribute)
        
        resource = related_type.constantize.find(related_id)
        
        if context[:current_user].can? :update, resource
          attachment = resource.send(attribute)

          attachment.purge
        else
          raise AuthorizationError
        end
      end
    end
  end