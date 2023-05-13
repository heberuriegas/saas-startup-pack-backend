class AttachmentSerializer < ActiveModel::Serializer
  attributes :id
  attributes :url
  attributes :medium_url
  attributes :small_url
  attributes :thumbnail_url
  has_one :blob, serializer: BlobSerializer
  attributes :created_at
  
  def url
    ENV['HOST']+Rails.application.routes.url_helpers.rails_blob_path(object, only_path: true) if object.present?
  end

  def medium_url
    if object.record_type.present?
      klass = object.record_type.constantize

      if klass.variants[:medium].present?
        ENV['HOST']+
        Rails.application.routes.url_helpers.rails_representation_url(object.variant(klass.variants[:medium]).processed, only_path: true) if object.present?
      end
    end
  end

  def small_url
    if object.record_type.present?
      klass = object.record_type.constantize

      if klass.variants[:small].present?
        ENV['HOST']+
        Rails.application.routes.url_helpers.rails_representation_url(object.variant(klass.variants[:small]).processed, only_path: true) if object.present?
      end
    end
  end

  def thumbnail_url
    if object.record_type.present?
      klass = object.record_type.constantize

      if klass.variants[:thumbnail].present?
        ENV['HOST']+
        Rails.application.routes.url_helpers.rails_representation_url(object.variant(klass.variants[:thumbnail]).processed, only_path: true) if object.present?
      end
    end
  end
end