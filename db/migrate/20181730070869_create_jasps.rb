class CreateJasps < ActiveRecord::Migration[5.2]
  def change
    create_table :jasps do |t|

      t.timestamps
    end
  end
end
