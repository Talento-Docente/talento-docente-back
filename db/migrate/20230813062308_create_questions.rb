class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.belongs_to :test

      t.integer :order_number, default: 1

      t.text :question
      t.text :hint

      t.integer :question_type, default: 0

      t.integer :value, default: 1
      t.string :group

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
