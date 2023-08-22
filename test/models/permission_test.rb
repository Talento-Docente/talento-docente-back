# == Schema Information
#
# Table name: permissions
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  permission       :integer          default("owner")
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#  user_id          :bigint
#
# Indexes
#
#  index_permissions_on_establishment_id  (establishment_id)
#  index_permissions_on_user_id           (user_id)
#
require "test_helper"

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
