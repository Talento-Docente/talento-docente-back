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
require "test_helper"

class StageConfigurationReferenceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
