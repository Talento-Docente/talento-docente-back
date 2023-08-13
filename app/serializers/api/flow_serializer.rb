module Api
  class FlowSerializer < ActiveModel::Serializer
    attributes :id,
               :name,
               :description,
               :establishment_id
  end
end
