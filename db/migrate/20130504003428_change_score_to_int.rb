class ChangeScoreToInt < ActiveRecord::Migration
  def change
  	change_column :posts, :score, :integer, :default => 0, :null => false
  end
end
