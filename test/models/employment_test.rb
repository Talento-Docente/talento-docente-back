# == Schema Information
#
# Table name: employments
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  description      :text
#  employment_type  :integer          default("presencial")
#  end_date         :date
#  hours            :integer          default(0)
#  qualification    :integer          default("practice")
#  salary           :integer
#  schedule_type    :integer          default("full_time")
#  start_date       :date
#  status           :integer          default("created")
#  title            :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#
# Indexes
#
#  index_employments_on_establishment_id  (establishment_id)
#
require "test_helper"

class EmploymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
