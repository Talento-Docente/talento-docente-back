class AddDniToEstablishment < ActiveRecord::Migration[7.0]
  def change
    add_column :establishments, :dni, :string, default: nil
  end
end
