# == Schema Information
#
# Table name: establishments
#
#  id         :bigint           not null, primary key
#  address    :string
#  deleted_at :datetime
#  name       :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class EstablishmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
