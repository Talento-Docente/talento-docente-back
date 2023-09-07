class CreateWorkExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :work_experiences do |t|
      t.belongs_to :applicant
      t.string :job_title
      t.string :business_name
      t.text :description
      t.date :start_date
      t.date :end_date

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
