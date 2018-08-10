class CreateJaspreets < ActiveRecord::Migration[5.2]
  def change
    create_table :jaspreets do |t|
      t.references :jasp, foreign_key: true
      t.timestamps
    end
  end
end
