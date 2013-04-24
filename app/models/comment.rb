class Comment < ActiveRecord::Base
  attr_accessible :contents, :post, :user
end
