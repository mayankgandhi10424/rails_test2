class CreateAssembliesAndParts < ActiveRecord::Migration[5.2]
  def change
    create_table :assemblies_parts do |t|
      t.belongs_to :assembly#, index: true
      t.belongs_to :part#, index: true
      t.timestamps
    end

    create_table :assemblies do |t|
      t.timestamps
      t.string :name
    end

    create_table :parts do |t|
      t.timestamps
      t.string :name
    end
  end
end
