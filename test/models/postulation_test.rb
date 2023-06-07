# == Schema Information
#
# Table name: postulations
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  applicant_id  :bigint
#  employment_id :bigint
#
# Indexes
#
#  index_postulations_on_applicant_id   (applicant_id)
#  index_postulations_on_employment_id  (employment_id)
#
require "test_helper"

class PostulationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
