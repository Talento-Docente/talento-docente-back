class CreateEmployments < ActiveRecord::Migration[7.0]
  def change
    create_table :employments do |t|
      t.belongs_to :establishment

      t.text :title
      t.text :description
      t.integer :salary

      t.integer :status, default: 0

      t.integer :employment_type, default: 0

      t.integer :qualification, default: 0

      t.integer :schedule_type, default: 0
      t.integer :hours, default: 0

      t.date :start_date
      t.date :end_date
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
