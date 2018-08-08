class CommentExample < ActiveRecord::Migration[5.2]
  def change
    create_table :examples, comment: "ENGINE=BLACKHOLE" do |t|
      t.string :name, null: false
    end
  end
end
