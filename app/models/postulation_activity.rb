# == Schema Information
#
# Table name: postulation_activities
#
#  id                               :bigint           not null, primary key
#  deleted_at                       :datetime
#  reference_type                   :integer          default("document")
#  resource_type                    :string
#  status                           :integer          default("created")
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  postulation_id                   :bigint
#  resource_id                      :bigint
#  stage_configuration_reference_id :bigint
#
# Indexes
#
#  index_postulation_activities_on_resource  (resource_type,resource_id)
#  pa_postulation_index                      (postulation_id)
#  pa_stage_configuration_reference_index    (stage_configuration_reference_id)
#
class PostulationActivity < ApplicationRecord

  # Constant
  REFERENCE_TYPE_DOCUMENT = 'document'
  REFERENCE_TYPE_TEST = 'test'
  STATUS_CREATED = 'created'
  STATUS_REALIZED = 'realized'

  # Relationship
  belongs_to :stage_configuration_reference
  belongs_to :postulation
  belongs_to :resource, polymorphic: true, optional: true
  has_one_attached :file

  # Soft Delete
  acts_as_paranoid

  # Enums
  enum reference_type: [
    REFERENCE_TYPE_DOCUMENT,
    REFERENCE_TYPE_TEST
  ]
  enum status: [
    STATUS_CREATED,
    STATUS_REALIZED
  ]
end
