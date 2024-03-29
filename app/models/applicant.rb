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
class Applicant < ApplicationRecord

  ENGLISH_LEVEL_1 = "english_level_1"
  ENGLISH_LEVEL_2 = "english_level_2"
  ENGLISH_LEVEL_3 = "english_level_3"
  ENGLISH_LEVEL_4 = "english_level_4"
  ENGLISH_LEVEL_5 = "english_level_5"
  ENGLISH_LEVEL_6 = "english_level_6"

  # Active Storage
  has_one_attached :curriculum

  # Relationship
  belongs_to :user, dependent: :destroy
  accepts_nested_attributes_for :user, allow_destroy: true, reject_if: :all_blank
  has_many :postulations
  has_many :employments, through: :postulations, class_name: "Employment"
  has_many :work_experiences
  accepts_nested_attributes_for :work_experiences, allow_destroy: true, reject_if: :all_blank
  has_many :academic_trainings
  accepts_nested_attributes_for :academic_trainings, allow_destroy: true, reject_if: :all_blank
  has_many :applicant_skills
  accepts_nested_attributes_for :applicant_skills, allow_destroy: true, reject_if: :all_blank
  has_many :skills, through: :applicant_skills, class_name: "Skill"
  accepts_nested_attributes_for :skills, allow_destroy: true, reject_if: :all_blank

  # Soft Delete
  acts_as_paranoid

  # Enum
  enum english_level: [
    ENGLISH_LEVEL_1,
    ENGLISH_LEVEL_2,
    ENGLISH_LEVEL_3,
    ENGLISH_LEVEL_4,
    ENGLISH_LEVEL_5,
    ENGLISH_LEVEL_6,
  ]

end
