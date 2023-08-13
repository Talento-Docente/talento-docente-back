# == Schema Information
#
# Table name: questions
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  group         :string
#  hint          :text
#  order_number  :integer          default(1)
#  question      :text
#  question_type :integer          default("selection")
#  value         :integer          default(1)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  test_id       :bigint
#
# Indexes
#
#  index_questions_on_test_id  (test_id)
#
class Question < ApplicationRecord

  # Constant
  QUESTION_TYPE_SELECTION = 'selection'
  QUESTION_TYPE_MULTIPLE = 'multiple'
  QUESTION_TYPE_OPEN = 'open'

  # Relationship
  belongs_to :test, dependent: :destroy
  has_many :alternatives

  # Soft Delete
  acts_as_paranoid

  enum question_type: [
    QUESTION_TYPE_SELECTION,
    QUESTION_TYPE_MULTIPLE,
    QUESTION_TYPE_OPEN
  ]

end
