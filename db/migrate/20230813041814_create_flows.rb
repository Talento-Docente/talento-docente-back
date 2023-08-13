class CreateFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :flows do |t|
      t.belongs_to :establishment

      t.string :name
      t.text :description

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
