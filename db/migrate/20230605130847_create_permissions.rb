class CreatePermissions < ActiveRecord::Migration[7.0]
  def change
    create_table :permissions do |t|
      t.belongs_to :user
      t.belongs_to :establishment
      t.integer :permission, default: 0

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
