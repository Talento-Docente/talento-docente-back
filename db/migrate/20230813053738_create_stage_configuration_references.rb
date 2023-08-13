class CreateStageConfigurationReferences < ActiveRecord::Migration[7.0]
  def change
    create_table :stage_configuration_references do |t|
      t.belongs_to :stage_configuration
      t.string :name
      t.string :description
      t.integer :reference_type, default: 0
      t.references :resource, polymorphic: true

      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
