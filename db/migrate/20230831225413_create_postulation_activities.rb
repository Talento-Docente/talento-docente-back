class CreatePostulationActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :postulation_activities do |t|
      t.belongs_to :postulation, index: { name: :pa_postulation_index }
      t.belongs_to :stage_configuration_reference, index: { name: :pa_stage_configuration_reference_index }
      t.integer :status, default: 0
      t.integer :reference_type, default: 0
      t.references :resource, polymorphic: true

      t.timestamp :realized_at
      t.timestamp :realize_until

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
