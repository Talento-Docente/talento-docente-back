# == Schema Information
#
# Table name: employment_answers
#
#  id                     :bigint           not null, primary key
#  answer                 :text
#  deleted_at             :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  employment_question_id :bigint
#  postulation_id         :bigint
#
# Indexes
#
#  index_employment_answers_on_employment_question_id  (employment_question_id)
#  index_employment_answers_on_postulation_id          (postulation_id)
#
require "test_helper"

class EmploymentAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
