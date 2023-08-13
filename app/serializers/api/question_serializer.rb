module Api
  class QuestionSerializer < ActiveModel::Serializer
    attributes :id,
               :group,
               :hint,
               :order_number,
               :question,
               :question_type,
               :value,
               :test_id,
               :alternatives

    has_many :alternatives, serializer: Api::AlternativeSerializer

  end
end
