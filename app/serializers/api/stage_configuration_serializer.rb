module Api
  class StageConfigurationSerializer < ActiveModel::Serializer
    attributes :id,
               :date_end,
               :meet_date,
               :meet_url,
               :employment_id,
               :stage_id,
               :stage,
               :stage_configuration_references

    has_one :stage, serializer: Api::StageSerializer
    has_many :stage_configuration_references, serializer: Api::StageConfigurationReferenceSerializer

  end
end
