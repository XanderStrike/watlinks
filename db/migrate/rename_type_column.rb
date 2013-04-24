class RenameTypeColumn < ActiveRecord::Migration
  def change
  	remove_column :posts, :type
    add_column :posts, :post_type , :string
  end
end
