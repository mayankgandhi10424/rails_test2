class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :approved, :boolean
    change_column_null :products, :name, false
    change_column_default :products, :approved, from: true, to: false
  end
end
