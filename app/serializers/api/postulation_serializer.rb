module Api
  class PostulationSerializer < ActiveModel::Serializer
    attributes :id,
               :applicant_id,
               :employment_id,
               :stage_id,
               :employment,
               :establishment,
               :created_at,
               :stage

    has_one :stage, serializer: Api::StageSerializer
    # has_one :employment, serializer: Api::EmploymentSerializer
    #
    def establishment
      object.employment&.establishment
    end
  end
end
