class DontUseConstraintForZipcodeValidationMigration < ActiveRecord::Migration[5.2]
  def change
    revert do
      add_column :apples, :patanahi, :string
    end
  end
end
