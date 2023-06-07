# == Schema Information
#
# Table name: establishments
#
#  id         :bigint           not null, primary key
#  address    :string
#  deleted_at :datetime
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Establishment < ApplicationRecord

  # Relationship
  has_many :permissions
  has_many :user, through: :permissions, class_name: "User"
  has_many :employments

  # Soft Delete
  acts_as_paranoid

end
