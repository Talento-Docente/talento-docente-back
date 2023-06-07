class CreateApplicants < ActiveRecord::Migration[7.0]
  def change
    create_table :applicants do |t|
      t.belongs_to :user

      t.text :description
      t.text :profesional_experience

      t.string :phone
      t.string :youtube
      t.string :linkedin
      t.string :briefcase
      t.string :twitter

      t.integer :english_level, default: 0

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
