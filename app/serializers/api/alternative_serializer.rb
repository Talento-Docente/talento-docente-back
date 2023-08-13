module Api
  class AlternativeSerializer < ActiveModel::Serializer
    attributes :id,
               :description,
               :hint,
               :key,
               :value,
               :question_id


  end
end
