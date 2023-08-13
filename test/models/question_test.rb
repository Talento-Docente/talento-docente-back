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
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
