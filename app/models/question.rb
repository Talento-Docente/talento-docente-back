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
  QUESTION_TYPE_SELECTION_UNIQUE = 'selection_unique'
  QUESTION_TYPE_SELECTION_MULTIPLE = 'selection_multiple'
  QUESTION_TYPE_TRUE_OR_FALSE = 'true_or_false'
  QUESTION_TYPE_AGREE_OR_DISAGREE = 'agree_or_disagree'
  QUESTION_TYPE_OPEN_ANSWER = 'open_answer'

  # Relationship
  belongs_to :test
  has_many :alternatives, dependent: :destroy
  accepts_nested_attributes_for :alternatives, allow_destroy: true

  # Soft Delete
  acts_as_paranoid

  enum question_type: [
    QUESTION_TYPE_SELECTION_UNIQUE,
    QUESTION_TYPE_SELECTION_MULTIPLE,
    QUESTION_TYPE_TRUE_OR_FALSE,
    QUESTION_TYPE_AGREE_OR_DISAGREE,
    QUESTION_TYPE_OPEN_ANSWER
  ]

end
