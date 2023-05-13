module Types
  class MutationType < Types::BaseObject
    field :create_attachment, mutation: Mutations::CreateAttachment, camelize: false
    field :destroy_attachment, mutation: Mutations::DestroyAttachment, camelize: false
    field :create_attachments, mutation: Mutations::CreateAttachments, camelize: false
  end
end
