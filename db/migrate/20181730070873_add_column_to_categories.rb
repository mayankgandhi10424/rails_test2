class AddColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :types, :string
  end
end
