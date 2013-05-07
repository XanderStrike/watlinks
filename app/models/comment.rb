class Comment < ActiveRecord::Base
  attr_accessible :contents, :post, :user

  validates :contents, :presence => true

  def contHTML
  	BlueCloth.new(self.contents).to_html
  end
end
