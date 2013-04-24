class Post < ActiveRecord::Base
  attr_accessible :board, :category, :description, :link, :score, :title, :user

  validates :title, :presence => true
  validates :description, :presence => true

  def descHTML
  	return self.description.gsub("\n", "<br>")
  end
end
