module Api
  class WorkExperienceSerializer < ActiveModel::Serializer
    include SerializerHelper

    attributes :id,
               :business_name,
               :description,
               :end_date,
               :job_title,
               :start_date,
               :applicant_id
  end
end
