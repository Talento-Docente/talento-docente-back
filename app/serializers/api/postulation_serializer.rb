module Api
  class PostulationSerializer < ActiveModel::Serializer
    attributes :id,
               :applicant_id,
               :employment_id,
               :stage_id

    has_one :stage, serializer: Api::StageSerializer
  end
end
