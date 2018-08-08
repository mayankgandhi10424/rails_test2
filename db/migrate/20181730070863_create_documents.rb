class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string :name
      t.timestamps
    end

    create_table :paragraphs do |t|
      t.timestamps     
      t.string :name 
      t.string :content
      t.belongs_to :section, index: true, foreign_key: true
    end

    create_table :sections do |t|
      t.timestamps
      t.string :name
      t.belongs_to :document, index: true, foreign_key: true
    end
  end
end
