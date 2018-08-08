class AddInitialApples < ActiveRecord::Migration[5.2]
  def up
    # 5.times do |i|
    #   # binding.pry
    #   Test.create(part_number: "Test ##{i}")
    # end
  end
 
  def down
    Test.delete_all
  end
end
