class ExampleMigrationSql < ActiveRecord::Migration[5.2]
  def change
    create_table :distributors do |t|
      t.string :zipcode
    end

    reversible do |dir|
      dir.up do
        #add a check constraint
        execute <<-SQL
          ALTER TABLE distributors ADD temp int;
        SQL
      end
      dir.down do
        # raise ActiveRecord::IrreversibleMigration
      end
    end

  end
end
