class CreateStages < ActiveRecord::Migration[7.0]
  def self.up
    create_table :stages do |t|
      t.belongs_to :flow

      t.string :name
      t.integer :order_number, default: 1
      t.text :description
      t.integer :stage_type

      t.timestamp :deleted_at
      t.timestamps
    end

    add_reference :postulations, :stage, null: true, foreign_key: true

  end

  def self.down
    remove_reference :postulations, :stage
    drop_table :stages
  end
end
