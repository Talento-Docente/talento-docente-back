class CreateEmploymentAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :employment_answers do |t|
      t.belongs_to :employment_question
      t.belongs_to :postulation
      t.text :answer

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
