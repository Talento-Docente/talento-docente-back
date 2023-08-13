# == Schema Information
#
# Table name: alternatives
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  hint        :text
#  key         :string
#  value       :integer          default(1)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint
#
# Indexes
#
#  index_alternatives_on_question_id  (question_id)
#
require "test_helper"

class AlternativeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
