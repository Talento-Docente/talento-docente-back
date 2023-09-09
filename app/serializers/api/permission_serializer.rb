module Api
  class PermissionSerializer < ActiveModel::Serializer
    attributes :id,
               :permission,
               :establishment_id,
               :user_id,
               :establishment

    # has_one :establishment, serializer: Api::EstablishmentSerializer

    def establishment
      Api::EstablishmentSerializer.new object.establishment
    end
  end
end
