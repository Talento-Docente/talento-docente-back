# == Schema Information
#
# Table name: skills
#
#  id         :bigint           not null, primary key
#  deleted_at :datetime
#  skill      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class SkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
