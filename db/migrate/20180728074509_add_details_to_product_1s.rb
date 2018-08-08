class AddDetailsToProduct1s < ActiveRecord::Migration[5.2]
  def change
    add_column :product_1s, :price, :decimal, precision: 5, scale: 2
    add_reference :product_1s, :supplier, polymorphic: true
  end
end
