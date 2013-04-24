class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :link
      t.string :score
      t.string :user
      t.string :board
      t.string :category

      t.timestamps
    end
  end
end
