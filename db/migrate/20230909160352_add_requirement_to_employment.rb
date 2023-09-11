class AddRequirementToEmployment < ActiveRecord::Migration[7.0]
  def change
    add_column :employments, :requirement, :text, default: nil
      add_column :employments, :benefit, :text, default: nil
  end
end
