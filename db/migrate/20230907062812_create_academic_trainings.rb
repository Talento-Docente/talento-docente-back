class CreateAcademicTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :academic_trainings do |t|
      t.belongs_to :applicant
      t.string :study_house_name
      t.string :career_name
      t.date :start_date
      t.date :end_date

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
