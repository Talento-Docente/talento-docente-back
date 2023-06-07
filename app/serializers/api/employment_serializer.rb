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
               :title
  end
end
