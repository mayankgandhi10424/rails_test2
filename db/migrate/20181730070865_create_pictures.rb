class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end

    create_table :employees do |t|
      t.string :name
      t.timestamps
    end
    
    create_table :items do |t|
      t.string :name
      t.timestamps
    end
  end
end
