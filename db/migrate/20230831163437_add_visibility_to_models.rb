class AddVisibilityToModels < ActiveRecord::Migration[7.0]
  def change
    add_column :employments, :visible, :boolean, default: false
    add_column :applicants, :visible, :boolean, default: false
  end
end
