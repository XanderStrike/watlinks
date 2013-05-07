class Post < ActiveRecord::Base
  attr_accessible :board, :category, :description, :link, :score, :title, :user

  validates :title, :presence => true
  validates :description, :presence => true

  def descHTML
  	BlueCloth.new(self.description).to_html
  end

  def comments
  	Comment.where(post: self.id)
  end
end
