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
               :visible,
               :english_level,
               :curriculum

    has_one :user, serializer: Api::UserSerializer
    has_many :work_experiences, serializer: Api::WorkExperienceSerializer
    has_many :academic_trainings, serializer: Api::AcademicTrainingSerializer
    has_many :skills, serializer: Api::SkillSerializer

    def curriculum
      if object.curriculum.attached?
        if Rails.application.config.active_storage.service == :local
          Rails.application.routes.url_helpers.url_for(object.curriculum)
        else
          object.curriculum&.url
        end
      end
    end
  end
end
