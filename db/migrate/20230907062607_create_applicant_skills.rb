class CreateApplicantSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :applicant_skills do |t|
      t.belongs_to :applicant
      t.belongs_to :skill

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
