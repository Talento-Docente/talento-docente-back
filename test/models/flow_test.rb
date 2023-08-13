# == Schema Information
#
# Table name: flows
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  description      :text
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#
# Indexes
#
#  index_flows_on_establishment_id  (establishment_id)
#
require "test_helper"

class FlowTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
