# == Schema Information
#
# Table name: tests
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  description      :string
#  name             :string
#  time_type        :integer          default("infinite")
#  time_value       :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#
# Indexes
#
#  index_tests_on_establishment_id  (establishment_id)
#
class Test < ApplicationRecord

  # Constant
  TIME_TYPE_INFINITE = 'infinite'
  TIME_TYPE_MINUTE = 'minute'
  TIME_TYPE_HOUR = 'hour'

  # Relationship
  belongs_to :establishment
  has_many :questions

  # Soft Delete
  acts_as_paranoid

  # Enums
  enum time_type: [
    TIME_TYPE_INFINITE,
    TIME_TYPE_MINUTE,
    TIME_TYPE_HOUR
  ]

end
