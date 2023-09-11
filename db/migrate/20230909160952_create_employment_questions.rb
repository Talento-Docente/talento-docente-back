class CreateEmploymentQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_questions do |t|
      t.belongs_to :employment
      t.string :question

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
