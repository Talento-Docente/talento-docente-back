# == Schema Information
#
# Table name: permissions
#
#  id               :bigint           not null, primary key
#  deleted_at       :datetime
#  permission       :integer          default("admin")
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
class Permission < ApplicationRecord

  # Constants
  PERMISSION_ADMIN = 'admin'
  PERMISSION_RECRUITER = 'recruiter'
  PERMISSION_POSTULATE = 'postulate'

  # Relationships
  belongs_to :user
  belongs_to :establishment

  # Soft Delete
  acts_as_paranoid

  # Enum
  enum permission: [
    PERMISSION_ADMIN,
    PERMISSION_RECRUITER,
    PERMISSION_POSTULATE
  ]

end
