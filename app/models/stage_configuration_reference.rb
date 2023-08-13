# == Schema Information
#
# Table name: stage_configuration_references
#
#  id                     :bigint           not null, primary key
#  deleted_at             :datetime
#  description            :string
#  name                   :string
#  reference_type         :integer          default("document")
#  resource_type          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  resource_id            :bigint
#  stage_configuration_id :bigint
#
# Indexes
#
#  index_stage_configuration_references_on_resource                (resource_type,resource_id)
#  index_stage_configuration_references_on_stage_configuration_id  (stage_configuration_id)
#
class StageConfigurationReference < ApplicationRecord

  # Constant
  REFERENCE_TYPE_DOCUMENT = 'document'
  REFERENCE_TYPE_TEST = 'test'

  # Relationship
  belongs_to :stage_configuration
  belongs_to :resource, polymorphic: true, optional: true
  has_one_attached :file

  # Soft Delete
  acts_as_paranoid

  # Enums
  enum reference_type: [
    REFERENCE_TYPE_DOCUMENT,
    REFERENCE_TYPE_TEST
  ]
end
