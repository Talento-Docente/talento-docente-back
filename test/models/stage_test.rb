# == Schema Information
#
# Table name: stages
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  description  :text
#  name         :string
#  order_number :integer          default(1)
#  stage_type   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flow_id      :bigint
#
# Indexes
#
#  index_stages_on_flow_id  (flow_id)
#
require "test_helper"

class StageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
