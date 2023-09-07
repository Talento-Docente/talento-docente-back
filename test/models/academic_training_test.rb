# == Schema Information
#
# Table name: academic_trainings
#
#  id               :bigint           not null, primary key
#  career_name      :string
#  deleted_at       :datetime
#  end_date         :date
#  start_date       :date
#  study_house_name :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  applicant_id     :bigint
#
# Indexes
#
#  index_academic_trainings_on_applicant_id  (applicant_id)
#
require "test_helper"

class AcademicTrainingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
