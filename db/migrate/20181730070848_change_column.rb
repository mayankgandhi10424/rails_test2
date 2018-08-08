class ChangeColumn < ActiveRecord::Migration[5.2]
  def up
    change_column :tests, :part_number, :text
  end
  def down
    change_column :tests, :part_number, :string
  end
end
