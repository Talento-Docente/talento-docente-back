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
class ApplicantSkill < ApplicationRecord

  # Constants
  belongs_to :skill
  belongs_to :applicant

  # Relationship

  # Soft Delete
  acts_as_paranoid

  # Enum
end
