# == Schema Information
#
# Table name: applicants
#
#  id                     :bigint           not null, primary key
#  briefcase              :string
#  deleted_at             :datetime
#  description            :text
#  english_level          :integer          default("english_level_1")
#  linkedin               :string
#  phone                  :string
#  profesional_experience :text
#  twitter                :string
#  visible                :boolean          default(FALSE)
#  youtube                :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :bigint
#
# Indexes
#
#  index_applicants_on_user_id  (user_id)
#
require "test_helper"

class ApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
