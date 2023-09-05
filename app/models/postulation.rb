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
#  stage_id      :bigint
#
# Indexes
#
#  index_postulations_on_applicant_id   (applicant_id)
#  index_postulations_on_employment_id  (employment_id)
#  index_postulations_on_stage_id       (stage_id)
#
# Foreign Keys
#
#  fk_rails_...  (stage_id => stages.id)
#
class Postulation < ApplicationRecord

  # Relationship
  belongs_to :employment
  has_one :establishment, through: :employment, class_name: "Establishment"
  belongs_to :applicant
  belongs_to :stage, optional: true

  # Soft Delete
  acts_as_paranoid

end
