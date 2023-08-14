module Api
  class FlowSerializer < ActiveModel::Serializer
    include SerializerHelper

    attributes :id,
               :name,
               :description,
               :establishment_id,
               :stages

    has_many :stages, serializer: Api::StageSerializer, if: -> { show_method? }
  end
end
