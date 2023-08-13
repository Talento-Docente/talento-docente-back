module Api
  class TestSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :name,
               :time_type,
               :time_value,
               :establishment_id,
               :questions

    has_many :questions, serializer: Api::QuestionSerializer
  end
end
