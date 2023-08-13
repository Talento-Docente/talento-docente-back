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
require "test_helper"

class StageConfigurationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
