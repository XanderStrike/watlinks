class AddPostVotedColumn < ActiveRecord::Migration
  def change
  	add_column :posts, :users_voted, :text
  end
end