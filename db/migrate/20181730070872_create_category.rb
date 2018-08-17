class CreateCategory < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category
      t.timestamps
    end
    
    create_table :articles do |t|
      t.string :article
      t.references :category, foreign_key: true
      t.timestamps
    end
    
    create_table :comments do |t|
      t.string :comment
      t.references :article, foreign_key: true
      t.timestamps
    end
    
    create_table :guests do |t|
      t.string :guest
      t.references :comment, foreign_key: true
      t.timestamps
    end

    create_table :tags do |t|
      t.string :tag
      t.references :article, foreign_key: true
      t.timestamps
    end
  end
end
