# == Schema Information
#
# Table name: stage_configurations
#
#  id            :bigint           not null, primary key
#  date_end      :datetime
#  deleted_at    :datetime
#  meet_date     :datetime
#  meet_url      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  employment_id :bigint
#  stage_id      :bigint
#
# Indexes
#
#  index_stage_configurations_on_employment_id  (employment_id)
#  index_stage_configurations_on_stage_id       (stage_id)
#
class StageConfiguration < ApplicationRecord

  # Relationship
  belongs_to :stage
  belongs_to :employment
  has_many :stage_configuration_references, dependent: :destroy
  accepts_nested_attributes_for :stage_configuration_references, allow_destroy: true

  # Soft Delete
  acts_as_paranoid
end
