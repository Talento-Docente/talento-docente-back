# == Schema Information
#
# Table name: employment_questions
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  question      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employment_id :bigint
#
# Indexes
#
#  index_employment_questions_on_employment_id  (employment_id)
#
class EmploymentQuestion < ApplicationRecord

  # Relationship
  belongs_to :employment

  # Soft Delete
  acts_as_paranoid

end
