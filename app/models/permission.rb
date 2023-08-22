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
class Permission < ApplicationRecord

  # Constants
  PERMISSION_OWNER = 'owner'
  PERMISSION_WRITE = 'write'
  PERMISSION_READ = 'read'

  # Relationships
  belongs_to :user
  belongs_to :establishment

  # Soft Delete
  acts_as_paranoid

  # Enum
  enum permission: [
    PERMISSION_OWNER,
    PERMISSION_WRITE,
    PERMISSION_READ
  ]

end
