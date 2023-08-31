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
require "test_helper"

class PostulationActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
