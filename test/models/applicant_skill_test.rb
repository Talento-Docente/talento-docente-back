# == Schema Information
#
# Table name: applicant_skills
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  applicant_id :bigint
#  skill_id     :bigint
#
# Indexes
#
#  index_applicant_skills_on_applicant_id  (applicant_id)
#  index_applicant_skills_on_skill_id      (skill_id)
#
require "test_helper"

class ApplicantSkillTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
