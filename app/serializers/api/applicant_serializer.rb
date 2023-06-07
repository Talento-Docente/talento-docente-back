module Api
  class ApplicantSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :profesional_experience,
               :phone,
               :youtube,
               :linkedin,
               :briefcase,
               :twitter,
               :english_level,
               :curriculum

    has_one :user, serializer: Api::UserSerializer

    def curriculum
      if object.curriculum.attached?
        if Rails.application.config.active_storage.service == :local
          Rails.application.routes.url_helpers.url_for(object.curriculum)
        else
          object.curriculum&.service_url
        end
      end
    end
  end
end
