# == Schema Information
#
# Table name: establishments
#
#  id         :bigint           not null, primary key
#  address    :string
#  deleted_at :datetime
#  dni        :string
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
  has_many :flows
  has_many :tests
  has_many :questions, through: :tests, class_name: "Question"
  has_many :alternatives, through: :questions, class_name: "Alternative"
  has_many :stages, through: :flows, class_name: "Stage"

  # Soft Delete
  acts_as_paranoid

end
