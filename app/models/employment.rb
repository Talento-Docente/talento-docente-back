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
#  visible          :boolean          default(FALSE)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  establishment_id :bigint
#  flow_id          :bigint
#
# Indexes
#
#  index_employments_on_establishment_id  (establishment_id)
#  index_employments_on_flow_id           (flow_id)
#
# Foreign Keys
#
#  fk_rails_...  (flow_id => flows.id)
#
class Employment < ApplicationRecord

  # Constants
  STATUS_CREATED = 'created'
  STATUS_IN_PROGRESS = 'in_progress'
  STATUS_CLOSED = 'closed'

  EMPLOYMENT_TYPE_PRESENCIAL = 'presencial'
  EMPLOYMENT_TYPE_REMOTO = 'remoto'
  EMPLOYMENT_TYPE_HYBRID = 'hybrid'

  QUALIFICATION_PRACTICE = 'practice'
  QUALIFICATION_JUNIOR = 'junior'
  QUALIFICATION_SEMI_SENIOR = 'semi_senior'
  QUALIFICATION_SENIOR = 'senior'

  SCHEDULE_TYPE_FULL_TIME = 'full_time'
  SCHEDULE_TYPE_PART_TIME = 'part_time'
  SCHEDULE_TYPE_OTHER_TIME = 'other_time'

  # Relationship
  belongs_to :establishment
  has_many :postulations
  has_many :applicants, through: :postulations, class_name: "Applicant"
  belongs_to :flow
  has_many :stage_configurations, dependent: :destroy
  accepts_nested_attributes_for :stage_configurations, allow_destroy: true

  # Soft Delete
  acts_as_paranoid

  # Enums
  enum status: [
    STATUS_CREATED,
    STATUS_IN_PROGRESS,
    STATUS_CLOSED
  ]
  enum employment_type: [
    EMPLOYMENT_TYPE_PRESENCIAL,
    EMPLOYMENT_TYPE_REMOTO,
    EMPLOYMENT_TYPE_HYBRID
  ]
  enum qualification: [
    QUALIFICATION_PRACTICE,
    QUALIFICATION_JUNIOR,
    QUALIFICATION_SEMI_SENIOR,
    QUALIFICATION_SENIOR
  ]
  enum schedule_type: [
    SCHEDULE_TYPE_FULL_TIME,
    SCHEDULE_TYPE_PART_TIME,
    SCHEDULE_TYPE_OTHER_TIME
  ]

  def postulations_resume
    postulations.group(:stage_id).count
  end
end
