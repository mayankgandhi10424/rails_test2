class ChangeTests < ActiveRecord::Migration[5.2]
  def change
    change_table :tests do |t|
      t.remove :name
      t.string :part_number
      t.index :part_number
      # t.rename :upccode, :upc_code
    end
  end
end
