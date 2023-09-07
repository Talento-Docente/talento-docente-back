# == Schema Information
#
# Table name: work_experiences
#
#  id            :bigint           not null, primary key
#  business_name :string
#  deleted_at    :datetime
#  description   :text
#  end_date      :date
#  job_title     :string
#  start_date    :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  applicant_id  :bigint
#
# Indexes
#
#  index_work_experiences_on_applicant_id  (applicant_id)
#
require "test_helper"

class WorkExperienceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
