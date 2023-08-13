module Api
  class StageConfigurationReferenceSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :name,
               :reference_type,
               :resource,
               :file

    def file
      if object.file.present?
        if Rails.application.config.active_storage.service == :local
          Rails.application.routes.url_helpers.url_for(object.file)
        else
          object.file&.service_url
        end
      end
    end

  end
end
