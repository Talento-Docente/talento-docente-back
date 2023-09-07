module Api
  class SkillSerializer < ActiveModel::Serializer
    include SerializerHelper

    attributes :id,
               :skill
  end
end
