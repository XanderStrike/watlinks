class Post < ActiveRecord::Base
  attr_accessible :board, :category, :description, :link, :score, :title, :user
end
