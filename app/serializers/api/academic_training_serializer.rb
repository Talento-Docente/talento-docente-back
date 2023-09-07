module Api
  class AcademicTrainingSerializer < ActiveModel::Serializer
    include SerializerHelper

    attributes :id,
               :career_name,
               :end_date,
               :start_date,
               :study_house_name,
               :applicant_id
  end
end
