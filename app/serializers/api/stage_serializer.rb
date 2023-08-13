module Api
  class StageSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :order_number,
               :name,
               :stage_type,
               :flow_id
  end
end
