class CreateAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :alternatives do |t|
      t.belongs_to :question

      t.string :key
      t.text :description
      t.text :hint

      t.integer :value, default: 1

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
