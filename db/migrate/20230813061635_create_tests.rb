class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.belongs_to :establishment

      t.string :name
      t.string :description

      t.integer :time_type, default: 0
      t.integer :time_value, default: 0

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
