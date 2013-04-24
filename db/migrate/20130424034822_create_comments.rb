class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :contents
      t.string :user
      t.string :post

      t.timestamps
    end
  end
end
