module Api
  class EstablishmentSerializer < ActiveModel::Serializer
    attributes :id,
               :address,
               :name,
               :phone
  end
end
