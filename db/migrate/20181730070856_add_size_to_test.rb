class AddSizeToTest < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :size, :string
  end
end
