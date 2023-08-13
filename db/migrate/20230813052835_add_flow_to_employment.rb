class AddFlowToEmployment < ActiveRecord::Migration[7.0]
  def self.up
    add_reference :employments, :flow, null: true, foreign_key: true
  end

  def self.down
    remove_reference :employments, :flow
  end
end
