class CreateProduct1s < ActiveRecord::Migration[5.2]
  def change
    create_table :product_1s do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
