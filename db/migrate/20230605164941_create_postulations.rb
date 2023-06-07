class CreatePostulations < ActiveRecord::Migration[7.0]
  def change
    create_table :postulations do |t|
      t.belongs_to :applicant
      t.belongs_to :employment

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
