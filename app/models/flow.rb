# == Schema Information
#
# Table name: flows
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  description      :text
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#
# Indexes
#
#  index_flows_on_establishment_id  (establishment_id)
#
class Flow < ApplicationRecord

  # Relationship
  belongs_to :establishment
  has_many :stages
  has_many :employments
  accepts_nested_attributes_for :stages, allow_destroy: true

  # Soft Delete
  acts_as_paranoid

end
