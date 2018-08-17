class CreateJaspreets < ActiveRecord::Migration[5.2]
  def change
    create_table :jaspreets do |t|
      # t.references :jasp, foreign_key: true
      t.timestamps
    end
    add_column :jaspreets, :jasp_id, :integer
    add_foreign_key :jasps, :jaspreets
  end
end
