class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_number
      t.timestamps
      t.belongs_to :supplier, index: {unique: true}, foreign_key: true
    end
  end
end
