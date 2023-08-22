module Api
  class EmploymentSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :employment_type,
               :end_date,
               :hours,
               :qualification,
               :salary,
               :schedule_type,
               :start_date,
               :status,
               :title,
               :flow_id,
               :establishment_id,
               :stage_configurations,
               :postulations_resume

    has_one :flow, serializer: Api::FlowSerializer
    has_many :stage_configurations, serializer: Api::StageConfigurationSerializer

  end
end
