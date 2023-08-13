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
               :establishment_id

    has_one :flow, serializer: Api::FlowSerializer

  end
end
