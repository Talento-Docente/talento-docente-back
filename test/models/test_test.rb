# == Schema Information
#
# Table name: tests
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  description      :string
#  name             :string
#  time_type        :integer          default("infinite")
#  time_value       :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#
# Indexes
#
#  index_tests_on_establishment_id  (establishment_id)
#
require "test_helper"

class TestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
