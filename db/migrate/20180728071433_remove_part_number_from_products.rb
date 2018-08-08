class RemovePartNumberFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_index :products, :part_number
    remove_column :products, :part_number, :string
  end
end
