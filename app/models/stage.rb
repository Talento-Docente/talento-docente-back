# == Schema Information
#
# Table name: stages
#
#  id           :bigint           not null, primary key
#  deleted_at   :datetime
#  description  :text
#  name         :string
#  order_number :integer          default(1)
#  stage_type   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  flow_id      :bigint
#
# Indexes
#
#  index_stages_on_flow_id  (flow_id)
#
class Stage < ApplicationRecord

  # Constants
  STAGE_TYPE_NORMAL = "normal"
  STAGE_TYPE_DOCUMENTS = "document"
  STAGE_TYPE_TEST = "test"
  STAGE_TYPE_MEET = "meet"
  STAGE_TYPE_FINISH = "finish"

  # Relationship
  belongs_to :flow
  has_many :postulations

  # Soft Delete
  acts_as_paranoid

  # Enums
  enum stage_type: [
    STAGE_TYPE_NORMAL,
    STAGE_TYPE_DOCUMENTS,
    STAGE_TYPE_TEST,
    STAGE_TYPE_MEET,
    STAGE_TYPE_FINISH,
  ]
end
