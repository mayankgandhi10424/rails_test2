class CreateJoinTableTestBest < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tests, :bests do |t|
      t.index :test_id
      t.index :best_id
    end
  end
end
