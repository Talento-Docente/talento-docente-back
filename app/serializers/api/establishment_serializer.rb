module Api
  class EstablishmentSerializer < ActiveModel::Serializer
    attributes :id,
               :address,
               :name,
               :phone,
               :dni,
               :picture

    def picture
      if object.picture.present?
        if Rails.application.config.active_storage.service == :local
          Rails.application.routes.url_helpers.url_for(object.picture)
        else
          object.picture&.url
        end
      end
    end
  end
end
