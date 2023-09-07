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
class Skill < ApplicationRecord

  # Constants

  # Relationships
  has_many :applicant_skills
  has_many :applicants, through: :applicant_skills, class_name: "Applicant"

  # Soft Delete
  acts_as_paranoid

  # Enum
end
