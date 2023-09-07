module Api
  class UserSerializer < ActiveModel::Serializer
    attributes :id,
               :birthday,
               :dni,
               :email,
               :first_name,
               :last_name,
               :name,
               :second_last_name,
               :picture,
               :permissions,
               :role,
               :applicant

    has_one :permissions, serializer: Api::PermissionSerializer
    has_one :applicant, serializer: Api::ApplicantSerializer
    has_many :work_experiences, serializer: Api::WorkExperienceSerializer
    has_many :academic_trainings, serializer: Api::AcademicTrainingSerializer
    has_many :skills, serializer: Api::SkillSerializer

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
