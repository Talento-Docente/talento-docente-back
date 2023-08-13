module Api
  class TestSerializer < ActiveModel::Serializer
    include SerializerHelper

    attributes :id,
               :description,
               :name,
               :time_type,
               :time_value,
               :establishment_id,
               :questions,
               :establishment

    has_many :questions, serializer: Api::QuestionSerializer, if: -> { show_method? }
    has_one :establishment, serializer: Api::EstablishmentSerializer, if: -> { show_method? }
  end
end
