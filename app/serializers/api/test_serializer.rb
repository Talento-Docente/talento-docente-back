module Api
  class TestSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :name,
               :time_type,
               :time_value,
               :establishment_id,
               :questions,
               :establishment

    has_many :questions, serializer: Api::QuestionSerializer
    has_one :establishment, serializer: Api::EstablishmentSerializer
  end
end
