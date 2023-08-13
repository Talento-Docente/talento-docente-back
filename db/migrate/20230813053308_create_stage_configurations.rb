class CreateStageConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_configurations do |t|
      t.belongs_to :stage
      t.belongs_to :employment

      # Meet
      t.string :meet_url
      t.datetime :meet_date

      # Test and Download
      t.datetime :date_end

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
