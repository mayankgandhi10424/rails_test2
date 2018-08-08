require_relative '20181730070851_example_migration_sql'

class FixupExampleMigration < ActiveRecord::Migration[5.2]
  def change
    revert ExampleMigrationSql

    create_table(:apples) do |t|
      t.string :variety
    end

    add_column :apples, :patanahi, :string
  end
end
