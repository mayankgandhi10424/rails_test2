class AddTestReferenceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :test, foreign_key: true

    revert do
      add_reference :products, :user, foreign_key: true
    end
  end
end
