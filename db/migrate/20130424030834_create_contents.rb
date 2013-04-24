class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :user
      t.string :post

      t.timestamps
    end
  end
end
