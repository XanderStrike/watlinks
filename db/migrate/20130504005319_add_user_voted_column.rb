class AddUserVotedColumn < ActiveRecord::Migration
  def change
  	add_column :users, :voted_on, :text
  end
end
