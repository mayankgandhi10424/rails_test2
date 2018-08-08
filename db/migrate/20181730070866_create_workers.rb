class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.references :manager, index: true
      t.timestamps
    end
  end
end
